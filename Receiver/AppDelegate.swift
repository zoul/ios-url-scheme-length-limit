import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func application(_ app: UIApplication, open url: URL,
        options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if let vc = app.keyWindow?.rootViewController as? ViewController {
            vc.receiveURL(url)
        }
        return true
    }
}

