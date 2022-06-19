import Foundation
import SwiftUI

struct BookAsyncSequence: View {

  var body: some View {

    Button("Action") {

      let stream = AsyncThrowingStream<Void, Error> { continuation in

        continuation.yield(())

        continuation.onTermination = { a in
          print("terminated", a)
        }

//        continuation.finish()
      }

      let task = Task {

        for try await value in stream {
          print(value)
        }

      }
      
      task.cancel()

    }

  }

}
