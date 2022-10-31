import SwiftUI
import Foundation

struct BookContiunationCancel: View {
  
//  @StateObject fileprivate var controller = Controller()
  
  var body: some View {
    
    Button("Action") {
      
      let task = Task {
        
        print("start")
        
        await withTaskCancellationHandler(
          operation: {
          },
          onCancel: {
            print("cancelled 1")
          }
        )
        
        print("1")
        
        await withTaskCancellationHandler(
          operation: {
            await withCheckedContinuation { (c: CheckedContinuation<Void, _>) in
              c.resume(returning: ())
            }
          },
          onCancel: {
            print("cancelled 2")
          }
        )
        
        print("2")
        
        await withTaskCancellationHandler(
          operation: {
            await withCheckedContinuation { (c: CheckedContinuation<Void, _>) in
            }
          },
          onCancel: {
            print("cancelled 3")
          }
        )
        
        print("3")
      }
      
      task.cancel()
      
    }
    
  }
  
}


