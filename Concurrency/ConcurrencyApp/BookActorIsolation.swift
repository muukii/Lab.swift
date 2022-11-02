
@MainActor
final class MyClass {
  
  nonisolated init() {
    self.child = .init()
  }
  
  nonisolated let child: Child
  var child2: Child { fatalError() }
  nonisolated var child3: Child { fatalError() }
  
  func run() {
    
  }
}

@MainActor
final class Child {
  
  nonisolated init() {}
  
  func run() {
    
  }
}

fileprivate func run() {
  
  let myClass = MyClass()
  
  Task.detached {
    _ = myClass
    await myClass.run()
    _ = myClass.child
    _ = await myClass.child2
    _ = myClass.child3
  }
}


