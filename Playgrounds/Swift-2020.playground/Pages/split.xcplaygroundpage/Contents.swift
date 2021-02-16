//: [Previous](@previous)

import Foundation

extension Collection where Index == Int {

  func chunked(into size: Index) -> [Self.SubSequence] {
    return stride(from: 0, to: count, by: size).map {
     self[$0 ..< Swift.min($0 + size, count)]
    }

  }

}

[1,2,3,4,5,6,7,8]
  .chunked(into: 3)
  .forEach { slice in
    print(slice.startIndex)
    slice.enumerated().forEach { i, e in
      print(i)
    }
  }


//: [Next](@next)
