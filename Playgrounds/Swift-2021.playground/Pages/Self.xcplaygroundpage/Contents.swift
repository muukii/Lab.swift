struct Value {
  
  func run() {
    Self.process()
  }
  
  static func process() {
    
  }
  
}

class Ref {
  
  func run() {
    Self.staticFunc()
    Self.classFunc()
  }
  
  static func staticFunc() {
    
  }
  
  class func classFunc() {
    
  }
  
}

print("end")
