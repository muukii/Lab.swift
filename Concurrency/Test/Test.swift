//
//  Test.swift
//  Test
//
//  Created by Muukii on 2021/10/30.
//

import XCTest

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

func _run() async -> String {
  print("Run", Thread.current)
  return "Value"
}

final class Test: XCTestCase {

  let storage = AsyncStorage<State>(.init())

  func test_1() async {
    async let state1 = storage.read()
    async let state2 = storage.read()
    async let state3 = storage.read()

    print(await storage.value.count)

    await storage.update {
      $0.count += 1
    }

    print(await [state1, state2, state3])
  }

  func test_async_let() async {

    async let v1 = _run()
    async let v2 = _run()
    async let v3 = _run()

//    print(await [v1, v2, v3])

  }

  func test_await_let() async {

    let v1 = await _run()
    let v2 = await _run()
    let v3 = await _run()

    //    print(await [v1, v2, v3])

  }
}
