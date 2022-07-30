
import Foundation
import SwiftUI

struct BookWeakify: View {
  
  @State var message: String = ""
  
  var body: some View {
    
    Text(message)
    Button("Action") {
      
//      let t = Task {
//        let object = Object()
//        await object.run()
//      }
            
      let t = Object().makeTask()
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        t.cancel()
      }
      
    }
    
  }
  
  final class Object {
    
    func run() async {
            
      PreviewLog.debug(.default, "0: \(Task.isCancelled)")
      
      await simulateNetworkRequest()
      
      PreviewLog.debug(.default, "1: \(Task.isCancelled)")
      hoge()
      
      await simulateNetworkRequest()
                       
      PreviewLog.debug(.default, "2: \(Task.isCancelled)")
            
    }
    
    func makeTask() -> Task<Void, Error> {
      
      Task.init {
        PreviewLog.debug(.default, "0: \(Task.isCancelled)")
        
        await simulateNetworkRequest()
        
        PreviewLog.debug(.default, "1: \(Task.isCancelled)")
        hoge()
        
        await simulateNetworkRequest()
        
        PreviewLog.debug(.default, "2: \(Task.isCancelled)")
      }
      
    }
   
    func hoge() {}
    
    deinit {
      PreviewLog.debug(.default, "deinit \(self)")
    }
    
  }
    
}

func simulateNetworkRequest() async {
  await withCheckedContinuation { c in
    DispatchQueue.global(qos: .default).asyncAfter(deadline: .now() + 1) {
      c.resume(returning: ())
    }
  }
}

extension Task {
  
  static func foo(operation: @escaping @Sendable () async -> Success) -> Task<Success, Never> {
    Task<Success, Never>.init {
      await operation()
    }
  }
  
  static func foo(operation: @escaping @Sendable () async throws -> Success) -> Task<Success, Error> {
    Task<Success, Error>.init {
      try await operation()
    }
  }
}
