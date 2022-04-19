import _Concurrency

class Service {
    
  func operation() async {
    
    try! await Task.sleep(nanoseconds: 3_000_000_000)
    
    print("timer done")
  }

  deinit {
    print("deinit")
  }
}

var s: Service! = Service()

let t = Task {
  await s.operation()
}

s = nil
