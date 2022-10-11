#if canImport(UIKit)
  import SnapshotTesting
  import UIKitHelpers
  import XCTest

  final class BSViewControllerTests: XCTestCase {
    func testBSContentViewController() {
      let customView = UIView()
      customView.backgroundColor = .white
      let label = UILabel()
      label.text = String(describing: BSContentViewController.self)
      customView.addSubview(label)
      label.centerXInSuperview()
      label.centerYInSuperview()

      let sut = BSContentViewController { customView }
      assertSnapshot(matching: sut, as: .image(on: .iPhone13Pro))
    }
  }
#endif
