//: [Previous](@previous)

import Foundation

let root = Progress(totalUnitCount: 20)

let a = Progress(totalUnitCount: 10)

root.addChild(a, withPendingUnitCount: 20)

root.fractionCompleted

a.fractionCompleted
a.completedUnitCount += 1
a.fractionCompleted

root.fractionCompleted
//: [Next](@next)

do {
  let a = Progress(totalUnitCount: 1)
  a.completedUnitCount = 1
  a.fractionCompleted
}

