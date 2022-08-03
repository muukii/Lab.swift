
import Foundation
import SwiftUI

struct BookCompile: View {
    
  var body: some View {
    
    Button("Action") {
            
      let controller = Controller()
      
//      Task.detached {
//        controller.run()
//      }
//      
//      topLevelPerform {
//        
//        controller.run()
//        
//        let _ = Controller()
//        
//      }
      
      
    }
    
  }
  
  @MainActor
  class Controller {
    
    func run() {
      print(Thread.current)
    }
    
    @MainActor
    init() {
      
    }
  }
  
  func topLevelPerform(_ closure: @escaping @Sendable () -> Void) {
    DispatchQueue.global().async {
      closure()
    }
  }
    
}

