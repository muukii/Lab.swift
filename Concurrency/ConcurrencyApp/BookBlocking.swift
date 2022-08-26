
import Foundation
import SwiftUI

struct BookBlocking: View {
  
  let manager = HeavyOperationManager()
      
  var body: some View {
    
    Button("Block sec") {
      
      sleep(2)
                  
      Task {
        
        await manager.runHeavyOperation()
        
//        runHeavyOperation()
//        runUIOperation()
//
//        Task.detached {
//          thunk_runUIOperation()
//        }
      }
      
    }
    
  }
  
}

actor HeavyOperationManager {
  
  func runHeavyOperation() {
    sleep(1)
  }
}

private func runHeavyOperation() {
  sleep(1)
}

private func thunk_runUIOperation() {
//  runUIOperation()
}

@MainActor
private func runUIOperation() {
  
}
