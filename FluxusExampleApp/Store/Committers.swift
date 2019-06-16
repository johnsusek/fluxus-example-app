import Fluxus

struct CounterCommitter: Committer {
  func commit(state: CounterState, mutation: CounterMutation) -> CounterState {
    var state = state

    switch mutation {
    case .Increment:
      state.count += 1
    case .AddAmount(let amount):
      state.count += amount
    }

    return state
  }
}
