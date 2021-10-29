//: [Previous](@previous)

import Foundation

class AFromVC {
  
  struct ComponentsToDetail: FromType {
    typealias To = DetailVC.ComponentsFromA
  }
  
  func perform(set: inout ComponentSet<List, Detail>) {
    
  }
  
}

class BFromVC {
  
  struct ComponentsToDetail {
    typealias To = DetailVC.ComponentsFromB

  }
  
  func perform(set: inout ComponentSet<List, Detail>) {
    
  }
  
}

class CFromVC {
  
  struct ComponentsToDetail {
    typealias To = DetailVC.ComponentsFromB

  }
  
  func perform(set: inout ComponentSet<List, Detail>) {
    
  }
  
}

class DetailVC {
  
  struct ComponentsFromA: ToType {
    typealias From = AFromVC.ComponentsToDetail
    
  }
  
  struct ComponentsFromB: ToType {
    typealias From = BFromVC.ComponentsToDetail

  }
  
  struct ComponentsFromC: ToType {
    typealias From = CFromVC.ComponentsToDetail

  }
  
  func perform(set: inout ComponentSet<AFromVC.ComponentsToDetail>) {
    
  }
    
  func perform(set: inout ComponentSet<BFromVC.ComponentsToDetail>) {
    
  }
    
  func perform(set: inout ComponentSet<CFromVC.ComponentsToDetail>) {
    
  }
    
}

enum Ani {
  
  static func animator(set: ComponentSet<AFromVC.ComponentsToDetail>) -> Void {
    
  }
  
  static func animator(set: ComponentSet<AFromVC.ComponentsToDetail>) -> Void {
    
  }
  
  static func animator(set: ComponentSet<AFromVC.ComponentsToDetail>) -> Void {
    
  }
}


protocol FromType {
  associatedtype To
}

protocol ToType {
  associatedtype From
}

enum Transitions {
  
  struct From: FromType {
    
  }
  
  struct To: ToType {
    
    typealias From =
    
  }
}

struct ComponentSet<From: FromType> where From.To {
  var from: From
  var to: To
  
  init() {
    fatalError()
  }
}

typealias List = Void
typealias Detail = Void


protocol FromComponentContainer {
  
  func foo(set: inout: ComponentSet)
}

protocol ToComponentContainer {
  
}

//: [Next](@next)
