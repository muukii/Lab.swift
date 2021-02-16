//: [Previous](@previous)

class FooValue {
  
  let value: String = ""
}

class MyValue: CustomReflectable {
  
  let value: String = ""
  
  var customMirror: Mirror {
    .init(self, children: ["value":value], displayStyle: .struct, ancestorRepresentation: .generated)
  }
}

String(reflecting: FooValue())

String(reflecting: MyValue())

//: [Next](@next)
