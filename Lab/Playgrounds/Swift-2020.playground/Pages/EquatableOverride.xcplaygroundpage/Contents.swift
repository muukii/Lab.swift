class Box<T>: Equatable {
  static func == (lhs: Box<T>, rhs: Box<T>) -> Bool {
    lhs === rhs
  }

  let value: T

  init(_ value: T) {
    self.value = value
  }
}

extension Box where T : Equatable {
  static func == (lhs: Box<T>, rhs: Box<T>) -> Bool {
    lhs === rhs || lhs.value == rhs.value
  }
}

let box = Box.init("")

box == box
