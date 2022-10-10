import SwiftUI
import UIKit
import UIKitHelpers

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = BSContentViewController {
      SplashView()
    }
    window?.makeKeyAndVisible()
    return true
  }
}
