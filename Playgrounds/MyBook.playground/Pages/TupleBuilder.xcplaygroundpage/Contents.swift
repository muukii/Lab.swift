//: [Previous](@previous)

@_functionBuilder
public enum TupleBuilder<Input> {
  public static func buildBlock<T1>(_ t1: @escaping (Input) -> T1) -> (Input) -> (T1) {
    return (t1)
  }

  public static func buildBlock<T1, T2>(_ t1: @escaping (Input) -> T1, _ t2: @escaping (Input) -> T2) -> (Input) -> (T1, T2) {
    return { input in
      (t1(input), t2(input))
    }
  }

  public static func buildBlock<T1, T2, T3>(_ t1: @escaping (Input) -> T1, _ t2: @escaping (Input) -> T2, _ t3: @escaping (Input) -> T3)
    -> (Input) -> (T1, T2, T3) {
      return { input in
        (t1(input), t2(input), t3(input))
      }
  }

  public static func buildBlock<T1, T2, T3, T4>(_ t1: @escaping (Input) -> T1, _ t2: @escaping (Input) -> T2, _ t3: @escaping (Input) -> T3, _ t4: @escaping (Input) -> T4)
    -> (Input) -> (T1, T2, T3, T4) {
      return { input in
        (t1(input), t2(input), t3(input), t4(input))
      }
  }

  public static func buildBlock<T1, T2, T3, T4, T5>(
    _ t1: @escaping (Input) -> T1, _ t2: @escaping (Input) -> T2, _ t3: @escaping (Input) -> T3, _ t4: @escaping (Input) -> T4, _ t5: @escaping (Input) -> T5
  ) -> (Input) -> (T1, T2, T3, T4, T5) {
    return { input in
      (t1(input), t2(input), t3(input), t4(input), t5(input))
    }
  }
}

func tuplify<T>(@TupleBuilder<String> make: (String) -> T) {
  make("")
}

tuplify { _ in
  { $0.description }
  { $0.description }
}
