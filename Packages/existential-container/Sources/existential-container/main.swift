enum Identifier: Hashable {
  case string(String)
  case integer(Int)
}

struct MyValue: Hashable {
  let a = 1
  let b = 1
  let c = 1
}

let muukii = "abc" as AnyHashable

do {
  let value = Identifier.integer(10)
  print(value)
}

do {
  let value = MyValue()
  let a: [String : AnyHashable] = ["a" : value, "b" : "bbb"]
  print(a)
}

