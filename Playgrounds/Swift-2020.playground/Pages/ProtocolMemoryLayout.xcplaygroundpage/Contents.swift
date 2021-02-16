import Foundation

protocol Foo {
  
}

struct A: Foo {
  let text0 = ""
  let text1 = ""
  let text2 = ""
  let text3 = ""
}

struct B: Foo {
  
}

class MyClass {
  
}


MemoryLayout<MyClass>.size

MemoryLayout<Foo>.size

var b: Foo = B()
b = A()

MemoryLayout.size(ofValue: b)
MemoryLayout.size(ofValue: A())

MemoryLayout.size(ofValue: AnyHashable.init(""))
MemoryLayout.size(ofValue: "")

