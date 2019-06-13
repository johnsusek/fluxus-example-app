import Fluxus

class AppRootGetter: RootGetter<AppRootState> {
  var countIsEven: Bool {
    get {
      return state.counterState.count % 2 == 0
    }
  }
}
