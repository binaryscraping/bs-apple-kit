#if canImport(UIKit)
import UIKit

open class BSView: UIView {

  public override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  @available(*, unavailable)
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  open func configure() {}
}

open class BSCollectionViewCell: UICollectionViewCell {
  @available(*, unavailable)
  public override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }

  @available(*, unavailable)
  public required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  open func configure() {}
}

open class ReusableCollectionViewCell<View: UIView>: BSCollectionViewCell {
  open override func configure() {
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
