#if canImport(UIKit)
  import SnapshotTesting
  import UIKitHelpers
  import XCTest

  final class BSViewControllerTests: XCTestCase {
    func testBSContentViewController() {
      let customView = UIView()
      let label = UILabel()
      label.text = String(describing: BSContentViewController.self)
      customView.addSubview(label)
      label.centerXInSuperview()
      label.centerYInSuperview()

      let sut = BSContentViewController { customView }
      assertSnapshot(matching: sut, as: .image)
    }
  }
#endif
