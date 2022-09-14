#if canImport(UIKit)
  import UIKit

  extension UICollectionViewCell {
    @objc
    open class var reuseIdentifier: String {
      String(describing: self)
    }
  }

  extension UICollectionView {
    public func register<C: UICollectionViewCell>(_ cellType: C.Type) {
      register(cellType, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }

    public func dequeueReusableCell<C: UICollectionViewCell>(
      _ cellType: C.Type,
      for indexPath: IndexPath,
      fileID: StaticString = #fileID,
      line: UInt = #line
    ) -> C {
      guard let cell = dequeueReusableCell(
        withReuseIdentifier: cellType.reuseIdentifier,
        for: indexPath
      ) as? C else {
        fatalError(
          """
          Fail to dequeue reusable cell with identifier: '\(cellType.reuseIdentifier)'.
          In file \(fileID) at line \(line).
          Make sure this cell has been registered.
          """
        )
      }

      return cell
    }
  }
#endif
