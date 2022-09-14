import Foundation

extension Result {
  public var error: Failure? {
    if case .failure(let error) = self { return error }
    return nil
  }
}
