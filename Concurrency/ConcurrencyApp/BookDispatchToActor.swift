
import Foundation
import SwiftUI

struct BookDispatchToActor: View {
  var body: some View {
    Button("Action") {
      foo()
    }
  }
}

struct BookDispatchToActor_Previews: PreviewProvider {
  static var previews: some View {
    BookDispatchToActor()
  }
}

private func foo() {
  thunk {
    Task.isCancelled
//    Task { @MainActor in
    run()
//    }
  }
}

private func thunk(_ closure: @escaping () -> Void) {
  closure()
}

@preconcurrency
@MainActor
private func run() {
  print("run")
}

private let _run: @preconcurrency @MainActor () -> Void = {
  
}
