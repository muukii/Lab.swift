import _Concurrency
import Foundation

final class Resource {
  deinit {
    print("🔥")
  }
}

var a: CheckedContinuation<Void, Never>? = nil

let r = Resource()

let task = Task {
  
  print("Start")
    
  await withTaskCancellationHandler {
    
//    _ = r
    
    await withCheckedContinuation { (c: CheckedContinuation<Void, _>) in
      a = c
    }
    
  } onCancel: {
    print("on-cancel")
  }

}

task.cancel()
 
a = nil
