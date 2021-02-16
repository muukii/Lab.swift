//: [Previous](@previous)

public protocol _ValueWrapper_OptionalProtocol {
  associatedtype Wrapped
  var _valueWrapper_Wrapped: Wrapped? { get }
}

extension Optional: _ValueWrapper_OptionalProtocol {
  public var _valueWrapper_Wrapped: Wrapped? {
    self
  }
}

@propertyWrapper
public struct ValueWrapper<Value> {
  
  private(set) public var wrappedValue: Value
  
  public var projectedValue: ValueWrapper<Value> {
    get { self }
    set { self = newValue }
  }
  
  public init(wrappedValue: Value) {
    self.wrappedValue = wrappedValue
  }
  
  public mutating func update(_ value: Value) {
    wrappedValue = value
  }
  
}

extension ValueWrapper where Value : _ValueWrapper_OptionalProtocol {
  
  public mutating func updateIfPresent(_ value: Value) {
    guard value._valueWrapper_Wrapped != nil else {
      return
    }
    update(value)
  }
  
  public mutating func updateIfPresent(_ closure: () -> Value) {
    updateIfPresent(closure())
  }
  
}


struct Foo {
  
  @ValueWrapper private var count: Int? = nil
      
  mutating func update() {
    count
    $count.updateIfPresent(10)
    count
    $count.updateIfPresent(nil)
    count
  }
}

var foo = Foo()
foo.update()

//: [Next](@next)
