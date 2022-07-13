
import Foundation
import SwiftUI

struct BookClosureActor: View {
  
  @State var message: String = ""
  
  var body: some View {
    
    Text(message)
    Button("Action") {
      
    
      
      //      let t = Task {
      //        let object = Object()
      //        await object.run()
      //      }
                     
    }
    
  }
  
  private func run(closure: @escaping @MainActor () async -> Void) {
    Task {
      await closure()
    }
  }
  
  private func run_1(closure: @escaping @MainActor () -> Void) {
    Task {
      await closure()
    }
  }
  
  private func run_2(closure: @escaping @MainActor () -> Void) {
    Task { @MainActor in
      closure()
    }
  }
    
}
