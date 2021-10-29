
import Foundation

struct MyError: LocalizedError {

  var errorDescription: String? {
    "Hello"
  }
}

var error: Error = MyError()

error.localizedDescription
