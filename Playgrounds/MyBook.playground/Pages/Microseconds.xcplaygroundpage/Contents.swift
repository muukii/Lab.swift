//: [Previous](@previous)

import Foundation

let time = Date()

time.timeIntervalSince1970
let micro = Int64(time.timeIntervalSince1970 * 1_000_000)
Double(micro) / 1_000_000


//: [Next](@next)
