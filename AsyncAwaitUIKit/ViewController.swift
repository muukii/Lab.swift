//
//  ViewController.swift
//  AsyncAwaitUIKit
//
//  Created by Muukii on 2021/07/28.
//

import MondrianLayout
import UIKit

final class ViewController: UIViewController {

  private let runButton = UIButton(type: .system)
  private let model = MyModel()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.

    var configuration = UIButton.Configuration.plain()
    configuration.title = "Run"
    runButton.configuration = configuration

    view.mondrian.buildSubviews {
      LayoutContainer(attachedSafeAreaEdges: .all) {
        ZStackBlock {
          VStackBlock {
            runButton
          }
        }
      }
    }

    runButton.addAction(.init(handler: { [unowned self] _ in

//      Task.detached {
//        let result = await model.startWork()
//        let completion = await model.doneWork()
//        print(result, completion)
//      }

      Task.init {
        let result = await model.startWork()
        let completion = await model.doneWork()
        print(result, completion)
      }

    }), for: .touchUpInside)

  }

}

func withClassicalHandling<S>(
  operation: @escaping @Sendable () async throws -> S,
  completion: @escaping (Result<S, Error>) -> Void
) {

  Task.detached {
    do {
      let result = try await operation()
      completion(.success(result))
    } catch {
      completion(.failure(error))
    }
  }

}

struct Box<A,B> {

  init(a: A, b: B) {

  }
}

class MyModel {

  func startWork() async -> Int {
    await withUnsafeContinuation { c in
      c.resume()
    }

    await withCheckedContinuation { c in
      c.resume()
    }
    return 0
  }

  @MainActor
  func doneWork() async -> Int {
    _ = await startWork()
    return 1
  }

}
