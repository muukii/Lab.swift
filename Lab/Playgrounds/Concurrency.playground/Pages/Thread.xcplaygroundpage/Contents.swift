import _Concurrency
import Foundation

func sendToBackground() async {
  try! await Task.sleep(nanoseconds: 1_000_000)
  await withCheckedContinuation { (c: CheckedContinuation<Void, Never>) in
    DispatchQueue.global().async {
      PT.assert(Thread.isMainThread == false)
      c.resume(returning: ())
    }
  }
}

DispatchQueue.main.async {
  
  PT.assert(Thread.isMainThread == false)
 
  Task.detached {
    
    PT.assert(Thread.isMainThread)
    
    print(Thread.current)
    
    await sendToBackground()
    
    print(Thread.current)
  }
}
