
@propertyWrapper
struct Edge<T>: Equatable {
  
  static func == (lhs: Edge<T>, rhs: Edge<T>) -> Bool {
    print("A")
    return false
  }

  var wrappedValue: T

  init(wrappedValue: T) {
    self.wrappedValue = wrappedValue
  }
}

extension Edge where T: Equatable {
  static func == (lhs: Edge<T>, rhs: Edge<T>) -> Bool {
    print("B")
    return false
  }
}

let a = Edge<Int>(wrappedValue: 1)
a == a
