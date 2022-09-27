/*
 BSD 3-Clause License

 Copyright (c) 2022, Chime
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice, this
    list of conditions and the following disclaimer.

 2. Redistributions in binary form must reproduce the above copyright notice,
    this list of conditions and the following disclaimer in the documentation
    and/or other materials provided with the distribution.

 3. Neither the name of the copyright holder nor the names of its
    contributors may be used to endorse or promote products derived from
    this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

// Code taken from: https://github.com/ChimeHQ/ConcurrencyPlus/blob/main/Sources/ConcurrencyPlus/TaskQueue.swift
import Foundation

private protocol Awaitable: Sendable {
  func waitForCompletion() async
}

extension Task: Awaitable {
  func waitForCompletion() async {
    _ = try? await value
  }
}

/// A serial queue that executes async tasks in the order they were submitted.
///
/// Conceptually similar to a serial `DispatchQueue`, but can accept async blocks. Unlike
/// with an unstructured `Task`, this makes it possible to control the ordering of events.
///
/// ```swift
/// let queue = TaskQueue()
///
/// queue.addOperation {
///     await asyncFunction()
///     await anotherAsyncFunction()
/// }
///
/// // This can can also return the underlying Task,
/// // so you can cancel, or await a value
/// let task = await queue.addOperation {
///     return await makeValue()
/// }
///
/// let value = try await task.value
/// ```
///
/// `TaskQueue` also defines a single global queue, to enable this:
///
/// ```swift
/// // Without .ordered, the execution order of these
/// // tasks is not well-defined.
/// Task.ordered {
///     event1()
/// }
///
/// Task.ordered(priority: .background) {
///     event2()
/// }
///
/// Task.ordered {
///     event3()
/// }
/// ```
public final class TaskQueue: @unchecked Sendable {
  static let global = TaskQueue()

  private let lock: NSLock
  private var lastOperation: Awaitable?
  private var pendingCount: Int

  public init() {
    lock = NSLock()
    pendingCount = 0

    lock.name = "com.chimehq.TaskQueue"
  }

  /// Submit a throwing operation to the queue.
  @discardableResult
  public func addOperation<Success>(
    priority: TaskPriority? = nil,
    operation: @escaping @Sendable () async throws -> Success
  )
    -> Task<Success, Error> where Success: Sendable
  {
    lock.lock()
    defer { lock.unlock() }

    let lastOperation = lastOperation
    pendingCount += 1

    let task: Task<Success, Error> = Task.detached(priority: priority) {
      // this await will do the right thing to avoid priority inversion
      await lastOperation?.waitForCompletion()

      defer { self.finishPendingOperation() }

      return try await operation()
    }

    self.lastOperation = task

    return task
  }

  /// Submit an operation to the queue.
  @discardableResult
  public func addOperation<Success>(
    priority: TaskPriority? = nil,
    operation: @escaping @Sendable () async -> Success
  )
    -> Task<Success, Never> where Success: Sendable
  {
    lock.lock()
    defer { lock.unlock() }

    let lastOperation = lastOperation
    pendingCount += 1

    let task: Task<Success, Never> = Task.detached(priority: priority) {
      // this await will do the right thing to avoid priority inversion
      await lastOperation?.waitForCompletion()

      defer { self.finishPendingOperation() }

      return await operation()
    }

    self.lastOperation = task

    return task
  }

  private func finishPendingOperation() {
    // we must do this to release the reference to the last task upon completion

    lock.lock()
    defer { lock.unlock() }

    pendingCount -= 1

    if pendingCount == 0 {
      lastOperation = nil
    }
  }

  public func allOperationsAreFinished() async {
    await addOperation(operation: {}).waitForCompletion()
  }
}

extension Task where Success == Void, Failure == Never {
  /// Submit a throwing operation to the global queue.
  @discardableResult
  public static func ordered<Success>(
    priority: TaskPriority? = nil,
    operation: @escaping @Sendable () async throws -> Success
  )
    -> Task<Success, Error> where Success: Sendable
  {
    TaskQueue.global.addOperation(priority: priority, operation: operation)
  }

  /// Submit an operation to the global queue.
  @discardableResult
  public static func ordered<Success>(
    priority: TaskPriority? = nil,
    operation: @escaping @Sendable () async -> Success
  )
    -> Task<Success, Never> where Success: Sendable
  {
    TaskQueue.global.addOperation(priority: priority, operation: operation)
  }
}
