import Fluxus

final class CounterCommitter: Committer {
  func commit(state: CounterState, mutation: CounterMutation) {
    switch mutation {
    case .Increment:
      state.count += 1
    case .AddAmount(let amount):
      state.count += amount
    }
  }
}
