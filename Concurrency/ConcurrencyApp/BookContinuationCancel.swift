import SwiftUI
import Foundation

struct BookContiunationCancel: View {
  
//  @StateObject fileprivate var controller = Controller()
  
  var body: some View {
    
    Button("Action") {
      
      let task = Task {
        
        print("start")
        
        await withTaskCancellationHandler(
          handler: {
            print("cancelled 1")
          },
          operation: {
            
          }
        )
        
        print("1")
        
        await withTaskCancellationHandler(
          handler: {
            print("cancelled 2")
          },
          operation: {
            await withCheckedContinuation { (c: CheckedContinuation<Void, _>) in
              c.resume(returning: ())
            }
          }
        )
        
        print("2")
        
        await withTaskCancellationHandler(
          handler: {
            print("cancelled 3")
          },
          operation: {
            await withCheckedContinuation { (c: CheckedContinuation<Void, _>) in
            }
          }
        )
        
        print("3")
      }
      
      task.cancel()
      
    }
    
  }
  
}


