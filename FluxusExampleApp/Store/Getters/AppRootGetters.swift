import Fluxus

class AppRootGetters: RootGetters<AppRootState> {
  var countIsEven: Bool {
    get {
      return rootState.counterState.count % 2 == 0
    }
  }
}
