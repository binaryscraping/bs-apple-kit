import Foundation

extension Result {
  public var error: Failure? {
    if case let .failure(error) = self { return error }
    return nil
  }
}
