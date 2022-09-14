#if canImport(UIKit)
import UIKit

open class BSViewController: UIViewController {
  public init() {
    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable)
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

/// A generic view controller that displays a custom `Content` view as its root view.
///
/// Example:
/// ```
/// let customView = MyCustomView()
/// let viewController = BSContentViewController(content: customView)
/// navigationController.push(viewController, animated: true)
/// ```
open class BSContentViewController<Content: UIView>: BSViewController {
  let content: Content

  public init(content: Content) {
    self.content = content
    super.init()
  }

  open override func loadView() {
    view = content
  }
}
#endif
