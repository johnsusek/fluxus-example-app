import Fluxus

enum CounterMutation: Mutation {
  case Increment
  case AddAmount(Int)
}
