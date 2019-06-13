import SwiftUI
import Fluxus

final class CounterDispatcher: Dispatcher {
  func dispatch(store: FluxStore, action: CounterAction) {
    switch action {
    case .IncrementRandom:
      IncrementRandom(store: store)
    }
  }

  func IncrementRandom(store: FluxStore) {
    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100), execute: {
      let exampleResultFromAsyncOperation = Int.random(in: 1..<100)
      store.commit(CounterMutation.AddAmount(exampleResultFromAsyncOperation))
    })
  }
}
