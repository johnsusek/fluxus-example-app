import SwiftUI

struct ContentView : View {
  @EnvironmentObject var store: RootStore

  var body: some View {
    NavigationView {
      Form {
        // Read the count from the store, and use a getter function to decide color
        Text("Count: \(store.state.counter.count)")
          .color(store.state.counter.countIsDivisibleBy(3) ? .orange : .green)

        Section {
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
        }

        // Use with bindings
        Toggle(isOn: myToggleBinding) {
          Text("My boolean is: \(myToggleBinding.value ? "true" : "false")")
        }
      }.navigationBarTitle(Text("Fluxus Example"))
    }
  }

  // Commit a mutation with a binding
  var myToggleBinding = Binding<Bool> (
    getValue: {
      rootStore.state.counter.myBoolValue
  },
    setValue: { value in
      rootStore.commit(CounterMutation.SetMyBool(value))
  })
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    return ContentView().environmentObject(rootStore)
  }
}
#endif
