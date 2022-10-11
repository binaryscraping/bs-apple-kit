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
    public func leadingToSuperview(offset: CGFloat = 0) -> NSLayoutConstraint {
      guard let superview else {
        fatalError("superview required.")
      }

      translatesAutoresizingMaskIntoConstraints = false
      let constraint = leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: offset)
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

    @discardableResult
    public func centerXInSuperview(offset: CGFloat = 0) -> NSLayoutConstraint {
      guard let superview else {
        fatalError("superview required.")
      }

      translatesAutoresizingMaskIntoConstraints = false
      let constraint = centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: offset)
      constraint.isActive = true
      return constraint
    }

    @discardableResult
    public func centerYInSuperview(offset: CGFloat = 0) -> NSLayoutConstraint {
      guard let superview else {
        fatalError("superview required.")
      }

      translatesAutoresizingMaskIntoConstraints = false
      let constraint = centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: offset)
      constraint.isActive = true
      return constraint
    }

    @discardableResult
    public func width(_ constant: CGFloat) -> NSLayoutConstraint {
      translatesAutoresizingMaskIntoConstraints = false
      let constraint = widthAnchor.constraint(equalToConstant: constant)
      constraint.isActive = true
      return constraint
    }

    @discardableResult
    public func height(_ constant: CGFloat) -> NSLayoutConstraint {
      translatesAutoresizingMaskIntoConstraints = false
      let constraint = heightAnchor.constraint(equalToConstant: constant)
      constraint.isActive = true
      return constraint
    }
  }
#endif
