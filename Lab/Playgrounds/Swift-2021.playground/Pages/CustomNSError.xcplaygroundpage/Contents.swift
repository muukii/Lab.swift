import Foundation

struct MyError: CustomNSError, LocalizedError {

  var errorDescription: String? {
    "Hey"
  }
}

let error: NSError = MyError() as NSError

print(error.description)
