#if canImport(UIKit)
  import UIKit

  extension UIViewController {
    public func add(_ child: UIViewController) {
      view.addSubview(child.view)
      addChild(child)
      child.didMove(toParent: self)
    }

    /// Remove itself from parent view controller.
    public func remove() {
      willMove(toParent: nil)
      removeFromParent()
      view.removeFromSuperview()
    }
  }
#endif
