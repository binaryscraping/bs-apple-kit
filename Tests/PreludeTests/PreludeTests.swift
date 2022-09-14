@testable import Prelude
import XCTest

final class TypesTests: XCTestCase {
  func testUnitEquality() {
    XCTAssertEqual(Unit(), Unit())
  }

  func testUnitHashing() {
    XCTAssertEqual(Unit().hashValue, Unit().hashValue)
  }

  func testSomeErrorEquality() {
    XCTAssertEqual(SomeError(), SomeError())
  }

  func testSomeErrorHashing() {
    XCTAssertEqual(SomeError().hashValue, SomeError().hashValue)
  }
}
