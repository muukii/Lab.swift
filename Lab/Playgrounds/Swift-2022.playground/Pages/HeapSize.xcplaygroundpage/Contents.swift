import Darwin

@_silgen_name("swift_class_getInstanceExtents") func swift_class_getInstanceExtents(_ theClass: AnyClass) -> (negative: UInt, positive: UInt)

class B {
  
//    let a: Int64 = 0
  
}

class MyClass {
  
//  let a: Int64 = 0
  
  let c: String = ""
//
  var b: B?
  
}


malloc_size(Unmanaged.passUnretained(MyClass()).toOpaque())

swift_class_getInstanceExtents(MyClass.self)
swift_class_getInstanceExtents(B.self)


