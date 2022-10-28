import SwiftUI
import Foundation
import PreviewLogger

extension PreviewLogger.Log {
  
  fileprivate static let continuation = Self(subsystem: "Continuation", category: "Debug")
}

struct BookContiunation: View {
  
  @StateObject fileprivate var controller = Controller()
  
  var body: some View {
    
    Button("Action") {
      controller.run()
    }
    
    Button("Run") {
      
      Task { @MainActor () -> Void in
        await withCheckedContinuation { _ in
          print(Thread.current)
        }
      }
      
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
    PreviewLog.debug(.continuation, "deinit \(self)")
  }
  
  init() {
    PreviewLog.debug(.continuation, "init \(self)")
  }
  
  var a: CheckedContinuation<Void, Never>? = nil
  
  func run() {
    PreviewLog.debug(.continuation, "Run \(self)")
    
    let c = TransientController()
    
    c.run()
    
  }
 
}

fileprivate final class TransientController {
  
  deinit {
    PreviewLog.debug(.continuation, "🔥 deinit \(self)")
  }
  
  func run() {
        
    let task = Task { [weak self] in
                      
      await withTaskCancellationHandler {
        
        
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        print(self)
        
        //        try? await throwingNever()
        await never()
        
      } onCancel: {
     
        print("cancel root")
      }
                            
    }
    
    print(task)
    
//    task.cancel()
    
    Task {
      
      try! await Task.sleep(nanoseconds: 1_000_000_000)
      
      task.cancel()
      
    }
            
  }
     
}

fileprivate func never() async {
  
  final class Box<T>: @unchecked Sendable {
    var continuation: CheckedContinuation<T, Never>?
  }
  
  let box: Box<Void> = .init()
  
  await withTaskCancellationHandler {
    await withCheckedContinuation { (c: CheckedContinuation<Void, _>) in
      
      print(Task.isCancelled)
      
      box.continuation = c
      
      // Dare to do nothing
    }
    
  } onCancel: {
   
  }
}

fileprivate func throwingNever() async throws {
  
  final class Box<T>: @unchecked Sendable {
    var continuation: CheckedContinuation<Void, Error>?
  }
  
  let box: Box<Void> = .init()
  
  try await withTaskCancellationHandler {
    
    try await withCheckedThrowingContinuation { (c: CheckedContinuation<Void, Error>) in
      
      guard Task.isCancelled == false else {
        c.resume(throwing: CancellationError())
        return
      }
      
      box.continuation = c
      
    }
    
  } onCancel: {
    
    box.continuation?.resume(throwing: CancellationError())
   
  }
}
