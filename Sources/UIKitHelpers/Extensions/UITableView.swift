#if canImport(UIKit)
  import UIKit

  extension UITableViewCell {
    @objc
    open class var reuseIdentifier: String {
      String(describing: self)
    }
  }

  extension UITableView {
    public func register<C: UITableViewCell>(_ cellType: C.Type) {
      register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

    public func dequeueReusableCell<C: UITableViewCell>(
      _ cellType: C.Type,
      for indexPath: IndexPath,
      fileID: StaticString = #fileID,
      line: UInt = #line
    ) -> C {
      guard
        let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? C
      else {
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
