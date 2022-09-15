import Foundation

extension Result {
  public var value: Success? {
    if case let .success(value) = self { return value }
    return nil
  }

  public var error: Failure? {
    if case let .failure(error) = self { return error }
    return nil
  }
}
