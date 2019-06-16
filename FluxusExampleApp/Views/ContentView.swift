import SwiftUI

struct ContentView : View {
  @EnvironmentObject var store: RootStore

  var body: some View {
    VStack {
      Text("Count: \(store.state.counter.count)")
        .color(store.state.counter.countIsDivisibleBy(3) ? .orange : .green)

      Button(action: { self.store.commit(CounterMutation.Increment) }) {
        Text("Increment")
      }

      Button(action: { self.store.commit(CounterMutation.AddAmount(5)) }) {
        Text("Increment by amount (5)")
      }

      Button(action: { self.store.dispatch(CounterAction.IncrementRandom) }) {
        Text("Increment random")
      }

      Button(action: { self.store.dispatch(CounterAction.IncrementRandomWithRange(20)) }) {
        Text("Increment random with range (20)")
      }
    }
  }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    let store = RootStore()
    return ContentView().environmentObject(store)
  }
}
#endif
