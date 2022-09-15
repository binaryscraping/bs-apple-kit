#if canImport(UIKit)
  import UIKit

  open class BSView: UIView {
    override public init(frame: CGRect) {
      super.init(frame: frame)
      configure()
    }

    @available(*, unavailable)
    public required init?(coder _: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    open func configure() {}
  }
#endif
