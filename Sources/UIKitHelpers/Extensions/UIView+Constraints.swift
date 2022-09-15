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

    @discardableResult
    public func leadingToSuperview() -> NSLayoutConstraint {
      guard let superview else {
        fatalError("superview required.")
      }

      translatesAutoresizingMaskIntoConstraints = false
      let constraint = leadingAnchor.constraint(equalTo: superview.leadingAnchor)
      NSLayoutConstraint.activate([constraint])
      return constraint
    }

    @discardableResult
    public func trailingToSuperview() -> NSLayoutConstraint {
      guard let superview else {
        fatalError("superview required.")
      }

      translatesAutoresizingMaskIntoConstraints = false
      let constraint = trailingAnchor.constraint(equalTo: superview.trailingAnchor)
      NSLayoutConstraint.activate([constraint])
      return constraint
    }

    @discardableResult
    public func topToSuperview() -> NSLayoutConstraint {
      guard let superview else {
        fatalError("superview required.")
      }

      translatesAutoresizingMaskIntoConstraints = false
      let constraint = topAnchor.constraint(equalTo: superview.topAnchor)
      NSLayoutConstraint.activate([constraint])
      return constraint
    }

    @discardableResult
    public func bottomToSuperview() -> NSLayoutConstraint {
      guard let superview else {
        fatalError("superview required.")
      }

      translatesAutoresizingMaskIntoConstraints = false
      let constraint = bottomAnchor.constraint(equalTo: superview.bottomAnchor)
      NSLayoutConstraint.activate([constraint])
      return constraint
    }
  }
#endif
