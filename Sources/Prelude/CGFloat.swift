import CoreGraphics

extension CGFloat {
  public static func grid(_ value: Int) -> CGFloat {
    CGFloat(value) * 4
  }
}
