import Foundation

enum Edge: Error, LocalizedError, CustomReflectable {
  case underlying(MyError)

  var errorDescription: String? { "hello" }

  var customMirror: Mirror {
    Mirror(
      self,
      children: [
        "errorDescription": localizedDescription,
        "errorDescription2": 2,
      ],
      displayStyle: .enum,
      ancestorRepresentation: .customized({ () -> Mirror in
        Mirror(self, children: [:])
      })
    )
  }
}

struct Node: Error, LocalizedError {
  let errorDescription: String? = "Hey"
}

struct MyError: Error {}

print(Node().localizedDescription)

print(String(describing: [Edge.underlying(MyError()) as Any]))
print(String(describing: [Node() as Any]))
