import Foundation
import SwiftUI

extension Int: Identifiable {
  public var id: Int { self }
}

ForEach.init(Binding.constant([1,2,3])) { $item in
  Text("\(item)")
}

@propertyWrapper
struct Wrapper<T> {
  
  var wrappedValue: T
  
  var projectedValue: Wrapper<T> { self }
  
  init(wrappedValue: T) {
    self.wrappedValue = wrappedValue
  }
  
  init(projectedValue: Wrapper<T>) {
    self = projectedValue
  }
}

func run<T>(_ value: T, perform: (Wrapper<T>) -> Void) {
  perform(Wrapper.init(wrappedValue: value))
}

run(10) { $value in
  print(value)
}
