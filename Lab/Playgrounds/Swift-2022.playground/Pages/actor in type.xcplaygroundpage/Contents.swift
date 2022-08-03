import Foundation
import _Concurrency

@MainActor
class IsolatedBase {

  var name: String = ""
  
  var onClick: @MainActor () -> Void = {}

  init() {

  }
  
  func _tap() {
    onClick()
  }
}

class NonIsolatedBase {
  
  var name: String = ""
  
  var onClick: @MainActor () -> Void = {}
  
  init() {
    
  }
  
  func _tap() {
    onClick()
  }
}



class Subclass: IsolatedBase {
  
  var subName: String = ""
  
  override init() {
    super.init()
  }
  
  func perform() {
    
  }
}


Task.init { @MainActor in
  
  // 💡 also initializer is isolated in main-actor
  let base = Base()
  let sublcass = Subclass()
  
  Task {
    // inheritating from Main-actor
    
    base.name

  }

  Task.detached {

    await base.name

    await sublcass.perform()
  }
  
}
