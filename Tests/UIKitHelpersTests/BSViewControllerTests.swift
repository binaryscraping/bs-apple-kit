#if canImport(UIKit)
  import UIKitHelpers
  import XCTest

  final class BSViewControllerTests: XCTestCase {
    func testBSContentViewController() {
      let customView = UIView()
      let sut = BSContentViewController(content: customView)
      sut.loadViewIfNeeded()
      XCTAssertIdentical(sut.view, customView)
    }
  }
#endif
