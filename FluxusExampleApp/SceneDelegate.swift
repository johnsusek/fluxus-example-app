import UIKit
import SwiftUI
import Fluxus

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    let window = UIWindow(frame: UIScreen.main.bounds)

    let store = RootStore()
    window.rootViewController = UIHostingController(rootView: ContentView().environmentObject(store))

    self.window = window
    window.makeKeyAndVisible()
  }
}
