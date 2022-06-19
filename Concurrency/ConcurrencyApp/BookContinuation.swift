import SwiftUI
import Foundation

struct BookContiunation: View {
  
  @StateObject fileprivate var controller = Controller()
  
  var body: some View {
    
    Button("Action") {
      controller.run()
    }
    
  }
  
}

fileprivate class Controller: ObservableObject {
  
  final class Resource {
    deinit {
      print("🔥")
    }
  }
  
  deinit {
    print("Deinit, \(self)")
  }
  
  init() {
    print("Init, \(self)")
  }
  
  var a: CheckedContinuation<Void, Never>? = nil
  
  func run() {
    let r = Resource()
    
    let task = Task { [weak self] in
      
      print("Start")
      
      await withTaskCancellationHandler {
        
        _ = r
        
        await withCheckedContinuation { (c: CheckedContinuation<Void, _>) in
          a = c
        }
        
      } onCancel: {
        print("on-cancel")
      }
      
    }
  }
    
}
