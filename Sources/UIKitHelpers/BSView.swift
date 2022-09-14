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
      view.translatesAutoresizingMaskIntoConstraints = false
      contentView.addSubview(view)

      NSLayoutConstraint.activate([
        view.topAnchor.constraint(equalTo: contentView.topAnchor),
        view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      ])
    }
  }
#endif
