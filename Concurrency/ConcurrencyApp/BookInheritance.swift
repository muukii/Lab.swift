//
//  BookInheritance.swift
//  ConcurrencyApp
//
//  Created by Muukii on 2022/08/27.
//

import Foundation
import SwiftUI

struct BookInheritance: View {
  var body: some View {
    Button("Action") {
      Inheritance.entyrpoint()
    }
  }
}

struct BookInheritance_Previews: PreviewProvider {
  static var previews: some View {
    BookInheritance()
  }
}


private enum Inheritance {
  
  @MainActor
  class MainActorAnnotatedClass {
    
    func perform_isolated() {
      print("isolated-main", Thread.current)
    }
    
    nonisolated func perform_nonisolated() {
      print("nonisolated", Thread.current)
    }
  }

  nonisolated static func entyrpoint() {
        
    Task { @MainActor in
      
      let instance = MainActorAnnotatedClass()
      
      instance.perform_isolated()
      
      Task.detached {
        await instance.perform_isolated()
        instance.perform_nonisolated()
      }
      
      Task.detached { [instance] in
        await instance.perform_isolated()
        instance.perform_nonisolated()
      }
    }
    
    Task {
      
      let i = await InheritedClass()
      await i.run()
      
    }
    
  }
  
}

@globalActor
struct MyActor {
  actor ActorType { }
  
  static let shared: ActorType = ActorType()
}

/**
 if it can call without `await`, there is in main-actor context.
 */
@MainActor
func checkActorContext() {}

@MainActor
protocol ActorIsolatedProtocol {}

protocol Sub_ActorIsolatedProtocol: ActorIsolatedProtocol {}

@MainActor
protocol Sub_ReIsolated_ActorIsolatedProtocol: ActorIsolatedProtocol {}

@MyActor
protocol Sub_UsingDifferentActor_ActorIsolatedProtocol: ActorIsolatedProtocol {}

extension Sub_ReIsolated_ActorIsolatedProtocol {
  func _sub_extension() {
    checkActorContext()
  }
}

extension Sub_ActorIsolatedProtocol {
  func _sub_extension() {
    // ❌ checkActorContext()
  }
}

@MainActor
extension Sub_ActorIsolatedProtocol {
  func __1() {
    checkActorContext()
  }
  
  nonisolated func __2() {
    // ❌ checkActorContext()
  }
  
  @MyActor
  func __3() {
    // ❌ checkActorContext()
  }
}

extension ActorIsolatedProtocol {
  
  func ext() {
    checkActorContext()
  }
}

class InheritedClass: ActorIsolatedProtocol {
  
  func run() {
    checkActorContext()
  }
}

class SubInheritedClass: Sub_ActorIsolatedProtocol {
  
  func run() {
    checkActorContext()
  }
}

class Sub_UsingDifferentActor_Impl: Sub_UsingDifferentActor_ActorIsolatedProtocol {
  func run () {
    // ❌ checkActorContext()
  }
}
