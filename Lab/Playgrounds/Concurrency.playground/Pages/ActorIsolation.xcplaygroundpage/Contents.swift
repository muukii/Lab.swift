
//@MainActor
final class MyClass {

  nonisolated init() {}
  
  
}

let myClass = MyClass()

Task {
  myClass
}
