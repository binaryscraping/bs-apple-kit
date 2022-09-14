#if canImport(UIKit)
  import UIKit

  extension UIView {
    @discardableResult
    public func edgesToSuperview() -> [NSLayoutConstraint] {
      guard let superview else {
        fatalError("superview required.")
      }

      translatesAutoresizingMaskIntoConstraints = false
      let constraints = [
        topAnchor.constraint(equalTo: superview.topAnchor),
        trailingAnchor.constraint(equalTo: superview.trailingAnchor),
        bottomAnchor.constraint(equalTo: superview.bottomAnchor),
        leadingAnchor.constraint(equalTo: superview.leadingAnchor),
      ]
      NSLayoutConstraint.activate(constraints)
      return constraints
    }
  }
#endif
