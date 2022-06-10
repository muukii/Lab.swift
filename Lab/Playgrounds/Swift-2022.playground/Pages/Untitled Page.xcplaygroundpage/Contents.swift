import UIKit

do {
  class A {

    init() {

    }

    convenience init(a: Void) {
      self.init()
    }

  }

  class B: A {

    override required init() {
      super.init()
    }
  }

  B.init()
  B.init(a: ())
}


do {
  class A {
    
    init() {
      
    }
    
    convenience init(a: Void) {
      self.init()
    }
    
  }
  
  class B: A {
    
    init(d: Void) {
      super.init()
    }
  }
  
  B.init(d: ())
//  B.init(a: ())
}
