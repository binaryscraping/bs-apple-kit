import SnapshotTesting
import UIKit
import UIKitHelpers
import XCTest

final class UIViewConstraintsTests: XCTestCase {
  func testEdgesToSuperview() {
    let view1 = UIView()
    let view2 = UIView()

    view1.addSubview(view2)
    view2.edgesToSuperview()

    let constraints = view1.constraints as NSArray
    assertSnapshot(matching: constraints, as: .dump)
  }

  func testTrailingToSuperview() {
    let view1 = UIView()
    let view2 = UIView()

    view1.addSubview(view2)
    view2.trailingToSuperview()

    let constraints = view1.constraints as NSArray
    assertSnapshot(matching: constraints, as: .dump)
  }

  func testLeadingToSuperview() {
    let view1 = UIView()
    let view2 = UIView()

    view1.addSubview(view2)
    view2.leadingToSuperview()

    let constraints = view1.constraints as NSArray
    assertSnapshot(matching: constraints, as: .dump)
  }

  func testTopToSuperview() {
    let view1 = UIView()
    let view2 = UIView()

    view1.addSubview(view2)
    view2.topToSuperview()

    let constraints = view1.constraints as NSArray
    assertSnapshot(matching: constraints, as: .dump)
  }

  func testBottomToSuperview() {
    let view1 = UIView()
    let view2 = UIView()

    view1.addSubview(view2)
    view2.bottomToSuperview()

    let constraints = view1.constraints as NSArray
    assertSnapshot(matching: constraints, as: .dump)
  }
}
