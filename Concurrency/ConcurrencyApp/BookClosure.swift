import Foundation
import SwiftUI

struct BookClosure: View {
  var body: some View {
    Button("run") {
      run()
    }
  }
}

struct BookClosure_Previews: PreviewProvider {
  static var previews: some View {
    BookClosure()
  }
}

@MainActor
fileprivate func run() {
  wrapper {
    print(Thread.current)
  }
}

@MainActor
fileprivate func wrapper(_ closure: @escaping @MainActor () -> Void) {
  _moduleFunction {
    // not guaranteed to run on main
    closure()
  }
}


fileprivate func _moduleFunction(_ closure: @escaping () -> Void) {
  DispatchQueue.global().async {
    closure()
  }
}
