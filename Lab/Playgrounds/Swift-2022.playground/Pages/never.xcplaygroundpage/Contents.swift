
struct Box<T> {
  
  var value: T {
    _value!
  }
  
  private var _value: T?
  
  init(_ value: T) {
    self._value = value
  }
  
  init() where T == Never {
    self._value = nil
  }
}

let b = Box<Never>.init()
