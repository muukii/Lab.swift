struct MyStruct: Hashable {
  let value = 1
}

enum Identifier: Hashable {
  case string(String)
  case integer(Int)
}

MemoryLayout<String>.size

MemoryLayout<Identifier>.size

MemoryLayout<AnyHashable>.size

dump("" as AnyHashable)
dump(MyStruct() as AnyHashable)
