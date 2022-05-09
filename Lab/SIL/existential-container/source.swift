enum Identifier: Hashable {
  case string(String)
  case integer(Int)
}

let value = "abc" as AnyHashable
