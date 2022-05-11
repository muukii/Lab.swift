import Foundation

class _Object: NSObject {
  
}

struct State {
  var a: Int8 = 44
//  var b: Bool = true
}

typealias Object = State

do {
  print("Array")
  var objects: Array<Object> = [.init(), .init(), .init(), .init()]
  
//  withUnsafeBytes(of: &objects) { rawBufferPointer in
//    print(rawBufferPointer.count)
//
//    for i in 0..<10000 {
//      if let p = rawBufferPointer.baseAddress?.advanced(by: i * MemoryLayout<Object>.size) {
//        print(i, p.assumingMemoryBound(to: Object.self).pointee)
//      }
//    }
//  }
}


do {
  print("Contiguous")
  var objects: ContiguousArray<Object> = [.init(), .init(), .init()]
//
//  withUnsafeBytes(of: &objects) { rawBufferPointer in
//
//    for p in rawBufferPointer {
//      print(p)
//    }
//  }
  
  objects.withUnsafeBytes { rawBufferPointer in
    print(rawBufferPointer.baseAddress?.advanced(by: 0).load(as: Object.self))
  }
  
}

