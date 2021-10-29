//: [Previous](@previous)

import Foundation

let now = DispatchTime.now()

let time: DispatchTimeInterval = .seconds(2)

print(time)

print(now.rawValue)
print(now.uptimeNanoseconds)

print((now + time).uptimeNanoseconds)

//: [Next](@next)
