import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.disableScreenSaver), name: .applicationDidBecomeActive, object: application)
        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.disableScreenSaver), name: .applicationWillEnterForeground, object: application)
        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.enableScreenSaver), name: .applicationWillResignActive, object: application)
        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.enableScreenSaver), name: .applicationDidEnterBackground, object: application)
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        NotificationCenter.default.post(name: .applicationDidEnterBackground, object: nil, userInfo: nil)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        NotificationCenter.default.post(name: .applicationDidBecomeActive, object: nil, userInfo: nil)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        NotificationCenter.default.post(name: .applicationWillResignActive, object: nil, userInfo: nil)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        NotificationCenter.default.post(name: .applicationWillEnterForeground, object: nil, userInfo: nil)
    }

    @objc func disableScreenSaver(_ object: Notification) {
        if let application: UIApplication = object.object as? UIApplication {
            application.isIdleTimerDisabled = false
        }
    }

    @objc func enableScreenSaver(_ object: Notification) {
        if let application: UIApplication = object.object as? UIApplication {
            application.isIdleTimerDisabled = true
        }
    }
}
