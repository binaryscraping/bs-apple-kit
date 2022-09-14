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
#endif
