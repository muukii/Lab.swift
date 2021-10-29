//: [Previous](@previous)

import Foundation

let userDefaults = UserDefaults(suiteName: "hoge")!

print(userDefaults.object(forKey: "dic"))

userDefaults.setValue(["a" : false, "b" : 0, "c" : "hello", 0 : 0], forKey: "dic")

//: [Next](@next)
