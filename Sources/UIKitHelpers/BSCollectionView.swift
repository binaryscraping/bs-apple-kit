#if canImport(UIKit)
  import UIKit

  open class BSCollectionViewCell: UICollectionViewCell {
    @available(*, unavailable)
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

  open class ReusableCollectionViewCell<View: UIView>: BSCollectionViewCell {
    override open func configure() {
      super.configure()

      let view = View()
      contentView.addSubview(view)
      view.edgesToSuperview()
    }
  }
#endif
