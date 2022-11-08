
@MainActor
final class MyClass {
  
  nonisolated init() {
    self.child = .init()
    self._child = .init()
  }
  
  nonisolated let child: Child
  let _child: Child
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

@MainActor
fileprivate final class _1 {

  let myClass: MyClass = .init()
  
  nonisolated func _1() {
    myClass._child
  }
  
}
