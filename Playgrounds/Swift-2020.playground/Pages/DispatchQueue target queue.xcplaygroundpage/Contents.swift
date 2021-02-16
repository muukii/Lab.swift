
import Dispatch

let queue = DispatchQueue.init(label: "my_queue", target: .global(qos: .background))

DispatchQueue.concurrentPerform(iterations: 100) { (i) in

  queue.async {
    
  }
}
