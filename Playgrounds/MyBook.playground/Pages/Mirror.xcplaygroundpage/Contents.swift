//: [Previous](@previous)

import SwiftUI

let v = VStack {
  HStack {
    Text("")
  }
}

print(Mirror(reflecting: v).subjectType)

print(Mirror(reflecting: AnyView(v)).subjectType)

Mirror(reflecting: AnyView(v)).children.forEach {
  print($0)
}
//: [Next](@next)
