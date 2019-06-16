import SwiftUI
import Combine
import Fluxus

final class RootStore: BindableObject {
  var didChange = PassthroughSubject<RootStore, Never>()

  var state = RootState() {
    didSet {
      didChange.send(self)
    }
  }

  func commit(_ mutation: Mutation) {
    switch mutation {
    case is CounterMutation:
      state.counter = CounterCommitter().commit(state: self.state.counter, mutation: mutation as! CounterMutation)
    default:
      print("Unknown mutation type!")
    }
  }

  func dispatch(_ action: Action) {
    switch action {
    case is CounterAction:
      CounterDispatcher(commit: self.commit).dispatch(action: action as! CounterAction)
    default:
      print("Unknown action type!")
    }
  }
}

