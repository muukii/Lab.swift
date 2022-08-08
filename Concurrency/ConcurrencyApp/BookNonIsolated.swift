import Foundation
import SwiftUI

struct BookNonIsolated: View {

  var body: some View {

    Button("Action") {

      perform()
    }

  }

  @MainActor
  class Controller {

    func run() {
      print(Thread.current)
    }

    @MainActor
    init() {

    }
  }

  func topLevelPerform(_ closure: @escaping @Sendable () -> Void) {
    DispatchQueue.global().async {
      closure()
    }
  }

}

@MainActor
private func runUI() {

}

func perform() {
  Task {
    print(Thread.current)
    await runUI()

  }
  DispatchQueue.global().async {

    Task {
      print(Thread.current)
      await runUI()

    }
  }
  
  DispatchQueue.main.async {
    
    Task {
      print(Thread.current)
      runUI()
      
    }
  }
}
