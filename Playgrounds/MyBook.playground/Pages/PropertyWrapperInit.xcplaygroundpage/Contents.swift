
@propertyWrapper
struct Edge<T> {

  var wrappedValue: T

  init(wrappedValue: T, options: Int) {
    self.wrappedValue = wrappedValue
  }
}

struct State {

  @Edge(options: 0) var hello: Int = 0
  
}
