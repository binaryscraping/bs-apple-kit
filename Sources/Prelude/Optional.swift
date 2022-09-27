import Foundation

extension Optional {
  /// Default error for when a required value isn't found.
  public struct RequiredValueError: Error {
    public init() {}
  }

  /// Unwrap Optional value or throw an error if none is found.
  /// - Parameter error: Error to throw when none value is found.
  /// - Returns: The wrapped value.
  @discardableResult
  public func required(orThrow error: @autoclosure () -> Error = RequiredValueError()) throws -> Wrapped {
    guard let value = self else {
      throw error()
    }

    return value
  }
}
