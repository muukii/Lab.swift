
for i in (1..<7) {
  
  let typeArgs = (1...i).map {
    "S\($0): Equatable"
  }
    .joined(separator: ", ")
  
  let type = (1...i).map {
    "S\($0)"
  }
    .joined(separator: ", ")
  
print("""
  
  /**
    Tuple binding initializer - \(type)
    It compares equality using `==` operator.
  */
  public init<\(typeArgs)>(
    _ tuple: (\(type)),
    middleware: Middleware? = nil
  ) where Value == (\(type)) {
    self.init(tuple, middleware: middleware, comparer: ==)
  }
""")
  
}
