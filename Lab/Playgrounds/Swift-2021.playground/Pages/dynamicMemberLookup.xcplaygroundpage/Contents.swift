
@dynamicMemberLookup
struct MemberBox<T> {
  
  let source: T
  
  subscript<U>(dynamicMember keyPath: KeyPath<T, U>) -> U {
    source[keyPath: keyPath]
  }
  
}

struct State {
  var name: String = ""
}

let box = MemberBox.init(source: State())

box.name

