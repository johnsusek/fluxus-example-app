import Fluxus

class AppRootGetters: RootGetters<AppRootState> {
  var countIsEven: Bool {
    get {
      return state.counterState.count % 2 == 0
    }
  }
}
