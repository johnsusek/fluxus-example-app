import UIKit
import SwiftUI
import Fluxus

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    let window = UIWindow(frame: UIScreen.main.bounds)

    let state = AppRootState()
    let committer = AppRootCommitter()
    let dispatcher = AppRootDispatcher()
    let store = FluxStore(withState: state, withCommitter: committer, withDispatcher: dispatcher)
    let getters = AppRootGetters(withState: state)

    window.rootViewController = UIHostingController(rootView: ContentView()
      .environmentObject(store)
      .environmentObject(getters)
      .environmentObject(state.counterState))

    self.window = window
    window.makeKeyAndVisible()
  }
}
