import _Concurrency

var deallocated = false

class Object {
  
  init() {
    
  }
    
  func run() {
    
    Task { [weak self] in
      print("Before sleep")
     
      PT.assertNotNil(self)
      
      guard let self = self else {
        PT.fail()
        return
      }
                   
      try! await Task.sleep(nanoseconds: 1_000_000)
      
      print("After sleep")
      
//      PT.assertNil(self)
    }
  }
 
  deinit {
    deallocated = true
    print("deinit")
  }
}

Object().run()

PT.assertEqual(deallocated, true)
