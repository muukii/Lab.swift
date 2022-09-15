protocol BoxType {

}

struct Box<T>: BoxType {

}

@resultBuilder
enum TupleBuilder<Root> {

  typealias Component<T> = (Root) -> T

  static func buildBlock<T1>(_ keyPath: KeyPath<Root, T1>) -> Component<T1> {
    return {
      $0[keyPath: keyPath]
    }
  }

  static func buildBlock<T1, T2>(_ keyPath1: KeyPath<Root, T1>, _ keyPath2: KeyPath<Root, T2>)
    -> Component<(T1, T2)>
  {
    return {
      (
        $0[keyPath: keyPath1],
        $0[keyPath: keyPath2]
      )
    }
  }

}

struct State {
  var a: String
}

func run<Intermediate>(@TupleBuilder<State> _ closure: () -> (State) -> Intermediate) -> (State) ->
  Intermediate
{
  let a = closure()
  return a
}

let map = run {
  \State.a
  \State.a
}
