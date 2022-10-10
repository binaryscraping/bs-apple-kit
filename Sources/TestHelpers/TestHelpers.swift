import XCTest

extension XCTestCase {
  /// Blocks the current task until a predicate is fulfilled, or fails with a timeout.
  /// This method is quite useful for testing async/await methods as this `wait` method calls `Task.yield` on every clock.
  public func wait(
    timeout: UInt64 = NSEC_PER_SEC,
    file: StaticString = #filePath,
    line: UInt = #line,
    until predicate: @escaping () -> Bool
  ) async {
    let start = DispatchTime.now().uptimeNanoseconds
    var timedOut = false

    while !predicate() {
      if start.distance(to: DispatchTime.now().uptimeNanoseconds) < timeout {
        timedOut = true
        break
      }

      await Task.yield()
    }

    if timedOut {
      XCTFail("[wait] timed out.", file: file, line: line)
    }
  }
}
