//: [Previous](@previous)

struct Source2 {
  var age: String
}

struct Source {
  var name: String = ""
  var s2: Source2 = .init(name: "")
}

@dynamicMemberLookup
struct MemberBox<T> {

  let source: T

  subscript<U>(dynamicMember keyPath: KeyPath<T, U>) -> U {
    source[keyPath: keyPath]
  }

//  func getValue<U>(_ keyPath: KeyPath<T, U>) -> U {
//    source[keyPath: keyPath]
//  }

}

func run<U>(_ keyPath: KeyPath<MemberBox<Source>, U>) {

}

var source = Source()

let obj: WritableKeyPath<Source, String> = \Source.name


//run(\.name)

let box: MemberBox<Source> = MemberBox.init(source: Source(name: "hello"))

box.name.count

//: [Next](@next)
