import Fluxus

final class AppRootDispatcher: RootDispatcher {
  let counterDispatcher = CounterDispatcher()

  func dispatch(store: FluxStore, action: Action) {
    switch action {
    case is CounterAction:
      counterDispatcher.dispatch(store: store, action: action as! CounterAction)
    default:
      print("Unknown action type: \(action)")
    }
  }
}
