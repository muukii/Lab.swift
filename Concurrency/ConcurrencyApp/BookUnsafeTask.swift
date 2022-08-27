import Foundation
import SwiftUI

struct BookUnsafeTask: View {
  var body: some View {
    VStack {
      Button("Run") {
        _UnsafeTask.run()
      }
      Button("Run Task") {
        Task {
          _UnsafeTask.run()
        }
      }
    }
  }
}

struct BookUnsafeTask_Previews: PreviewProvider {
  static var previews: some View {
    BookUnsafeTask()
  }
}

private enum _UnsafeTask {

  static func run() {
    print("isInTask =>", isInTask)
  }

}

private var isInTask: Bool {
  withUnsafeCurrentTask { $0 != nil }
}
