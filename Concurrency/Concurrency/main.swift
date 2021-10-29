
import Foundation
import _Concurrency

public actor AsyncStorage<Value> {

  public var value: Value

  public init(_ value: Value) {
    self.value = value
  }

  public func read() async -> Value {
    print("Read", Thread.current)
    return value
  }

  public func update(_ mutate: (inout Value) -> Void) async {
    print("Update", Thread.current)
    mutate(&value)
  }
}

struct State {
  var count: Int = 0
}

func run() async String {
  print("Run", )
}

let storage = AsyncStorage<State>(.init())

Task.detached {

  async let state1 = storage.read()
  async let state2 = storage.read()
  async let state3 = storage.read()

  print(await storage.value.count)

  await storage.update {
    $0.count += 1
  }

  print(await [state1, state2, state3])
}

print("Completed")

RunLoop.main.run()
