import SwiftUI
import Fluxus

struct ContentView: View {
  @EnvironmentObject var store: FluxStore
  @EnvironmentObject var getters: AppRootGetters
  @EnvironmentObject var counterState: CounterState

  var body: some View {
    VStack {
      Text("Count: \(counterState.count)")
        .color(getters.countIsEven ? .orange : .green)

      Button(action: { self.store.commit(CounterMutation.Increment) }) {
        Text("Increment")
      }

      Button(action: { self.store.dispatch(CounterAction.IncrementRandom) }) {
        Text("Increment Random (Async)")
      }
    }
  }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    let state = AppRootState()
    let committer = AppRootCommitter()
    let dispatcher = AppRootDispatcher()
    let store = FluxStore(withState: state, withCommitter: committer, withDispatcher: dispatcher)
    let getters = AppRootGetters(withState: state)

    return ContentView()
      .environmentObject(store)
      .environmentObject(getters)
      .environmentObject(state.counterState)
  }
}
#endif
