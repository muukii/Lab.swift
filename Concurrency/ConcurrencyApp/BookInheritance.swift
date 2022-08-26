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
        
  }
  
}
