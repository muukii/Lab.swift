
import Foundation
import SwiftUI

struct BookWeakify: View {
  
  @State var message: String = ""
  
  var body: some View {
    
    Text(message)
    Button("Action") {
      
      let object = Object()
      
      Task {
        await object.run()
      }
      
    }
    
  }
  
  final class Object {
    
    func run() async {
      
      PreviewLog.debug(.default, "Start")
      
      await Task { [weak self] in
        print(self)
        try? await Task.sleep(nanoseconds: 1_000_000_000)
      }
      .value
      
      await Task { [weak self] in
        print(self)
        try? await Task.sleep(nanoseconds: 1_000_000_000)
      }
      .value
            
      PreviewLog.debug(.default, "End")
    }
    
    deinit {
      PreviewLog.debug(.default, "deinit \(self)")
    }
    
  }
    
}

