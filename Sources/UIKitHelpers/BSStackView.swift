#if canImport(UIKit)
  import UIKit

  public final class BSVStack: UIStackView {
    public init(
      _ children: [UIView],
      spacing: CGFloat = UIStackView.spacingUseDefault,
      distribution: UIStackView.Distribution = .fillEqually
    ) {
      super.init(frame: .zero)
      axis = .vertical
      self.spacing = spacing
      self.distribution = distribution
      children.forEach(addArrangedSubview(_:))
    }

    @available(*, unavailable)
    required init(coder _: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
  }

  public final class BSHStack: UIStackView {
    public init(
      _ children: [UIView],
      spacing: CGFloat = UIStackView.spacingUseDefault,
      distribution: UIStackView.Distribution = .fillEqually
    ) {
      super.init(frame: .zero)
      axis = .horizontal
      self.spacing = spacing
      self.distribution = distribution
      children.forEach(addArrangedSubview(_:))
    }

    @available(*, unavailable)
    required init(coder _: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
  }
#endif
