
@propertyWrapper
struct MyWrapper<Value> {
  
  var wrappedValue: Value
  
  var projectedValue: Self {
    self
  }
  
  init(wrappedValue: Value) {
    self.wrappedValue = wrappedValue
  }
      
}

func run(_ perform: (@MyWrapper<Int>) -> Void) {
  
}

func _run(@MyWrapper name: String) {
  
}
