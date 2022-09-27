import Prelude
import XCTest

final class OptionalTests: XCTestCase {
  func testRequiredShouldThrow() {
    let optional: Int? = nil
    XCTAssertThrowsError(try optional.required())
  }

  func testRequired() {
    let optional: Int? = 1
    XCTAssertNoThrow(try optional.required())
  }
}
