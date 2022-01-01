//
//  Test.swift
//  Test
//
//  Created by Muukii on 2021/10/30.
//

import XCTest

final class Test: XCTestCase {

  func test_reentrancy() async {

    actor MyActor {

      var values: [String] = []

      func operation() async {

        values.append("In")
        try! await Task.sleep(nanoseconds: 2 * 1_000_000_000)
        values.append("Out")

      }

    }

    let actor = MyActor()

    await withTaskGroup(of: Void.self) { group in

      for _ in 0..<10 {
        group.addTask {
          await actor.operation()
        }
      }

    }

    print(await actor.values)

  }

  func test_task_inheritance() async {

    final class MyController {

      /// owned by MainActor
      @MainActor
      func entrypoint() async {

        print("Entry", Thread.current)

        /// inherits context - runs on MainActor
        _ = await Task {
          print("entrypoint.task", Thread.current) // Main
        }
        .result

        /// calls a function that is not owned by MainActor
        /// It might block MainThread. it's up to the body of the function.
        /// If blocking occurred, wrapping with `Task.detached`.
        await subFunction()
      }

      /// owned by no one@
      func subFunction() async {

        /**
         Here is nothing the context of concurrency since this function is not owned by anyone.
         Using Task dispatches on background.
         Task.detached would be same behavior. (probably)
         */

        print("subFunction", Thread.current)
        _ = await Task {
          print("subFunction.task", Thread.current)
        }
        .result

        _ = await Task.detached {
          print("subFunction.task.detached", Thread.current)
        }
        .result
      }

    }

    let controller = MyController()

    await controller.entrypoint()


  }

}
