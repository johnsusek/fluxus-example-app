import SwiftUI

struct ContentView : View {
  @EnvironmentObject var store: RootStore

  var body: some View {
    VStack(spacing: 16) {
      // Read the count from the store, and use a getter function to decide color
      Text("Count: \(store.state.counter.count)")
        .color(store.state.counter.countIsDivisibleBy(3) ? .orange : .green)

      // Commit a mutation without a param
      Button(action: { self.store.commit(CounterMutation.Increment) }) {
        Text("Increment")
      }

      // Commit a mutation with a param
      Button(action: { self.store.commit(CounterMutation.AddAmount(5)) }) {
        Text("Increment by amount (5)")
      }

      // Dispatch an action without a param
      Button(action: { self.store.dispatch(CounterAction.IncrementRandom) }) {
        Text("Increment random")
      }

      // Dispatch an action with a param
      Button(action: { self.store.dispatch(CounterAction.IncrementRandomWithRange(20)) }) {
        Text("Increment random with range (20)")
      }

      // Use with control bindings
      Toggle(isOn: $store.state.counter.myBoolBinding) {
        Text("My boolean is: \(store.state.counter.myBoolBinding ? "true" : "false")")
      }
    }.padding()
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
