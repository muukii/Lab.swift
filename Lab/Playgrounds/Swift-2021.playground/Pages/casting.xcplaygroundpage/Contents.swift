protocol My {
  var name: String { get }
}

struct A: Hashable, My {
  let name: String
  let age: Int64 = -2
}

struct B: Hashable {
  let name: String
  let age: UInt64
}

let a = A(name: "name")
let _a = a as AnyHashable
let __a = a as Any
let ___a = a as My


dump(_a)

PT.assert((_a as! A).name == "name")

dump(__a)

MemoryLayout.size(ofValue: Int64(0))
MemoryLayout.size(ofValue: a)
MemoryLayout.size(ofValue: __a)
MemoryLayout.size(ofValue: ___a)

func hoge(value: My) {

}

func hoge<Value: My>(value: Value) {

}

//unsafeBitCast(_a, to: A.self)
//unsafeBitCast(__a, to: A.self)

let b = unsafeBitCast(a, to: B.self)
String(b.age, radix: 2, uppercase: true)
dump(b)
