import Fluxus

class AppRootCommitter: RootCommitter {
  let counterCommitter = CounterCommitter()

  func commit(state rootState: RootState, mutation: Mutation) {
    guard let state = rootState as? AppRootState else { return }

    switch mutation {
    case is CounterMutation:
      counterCommitter.commit(state: state.counterState, mutation: mutation as! CounterMutation)
    default:
      print("Unknown mutation type: \(mutation)")
    }
  }
}
