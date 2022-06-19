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
    PreviewLog.debug("deinit", self)
  }
  
  init() {
    PreviewLog.debug("deinit", self)
  }
  
  var a: CheckedContinuation<Void, Never>? = nil
  
  func run() {
    PreviewLog.debug("Run", self)
    
    let c = TransientController()
    
    c.run()
    
  }
    
}

fileprivate final class TransientController {
  
  deinit {
    PreviewLog.debug("deinit", self)
  }
  
  func run() {
    
    let task = Task {
      
    }
    
  }
    
}
