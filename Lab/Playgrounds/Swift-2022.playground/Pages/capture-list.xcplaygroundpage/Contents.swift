
class Ref {
  
  deinit {
    print("deinit")
  }
  
}

func run(_ closure: @escaping () -> Void) {
  closure()
}

let ref = Ref()

Unmanaged.passUnretained(ref).release()

run { [weak ref] in
        
  run { [unowned ref] in
    PT.assert(ref == nil)
    
    run { [weak ref] in
      PT.assert(ref == nil)
      
      run { 
        PT.assert(ref == nil)
      }
      
    }
  }
}


