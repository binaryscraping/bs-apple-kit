#if canImport(UIKit)
  import SnapshotTesting
  import UIKit
  import UIKitHelpers
  import XCTest

  final class BSStackViewTests: XCTestCase {
    func testBSVStack() {
      let views = (0 ..< 5).map { _ in
        let view = UIView()
        view.backgroundColor = .gray
        view.height(40)
        return view
      }

      let sut = BSVStack(views, spacing: 10)
      assertSnapshot(matching: BSContentViewController { sut }, as: .image(on: .iPhone13Pro))
    }

    func testBSHStack() {
      let views = (0 ..< 5).map { _ in
        let view = UIView()
        view.backgroundColor = .gray
        view.width(40)
        return view
      }

      let sut = BSHStack(views, spacing: 10)
      assertSnapshot(matching: BSContentViewController { sut }, as: .image(on: .iPhone13Pro))
    }
  }
#endif
