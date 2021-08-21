//: [Previous](@previous)

struct Member<T>: Hashable {
  let index: Int
}

@dynamicMemberLookup
protocol DynamicMemberType {
  associatedtype MemberSet
  subscript<T>(dynamicMember keyPath: KeyPath<MemberSet, T>) -> T { get set }
}

struct MyEntity: DynamicMemberType {

  struct MemberSet {
    let name: Member<String> = .init(index: 0)
  }

  var storage: [Member]

  subscript<T>(dynamicMember keyPath: KeyPath<MemberSet, T>) -> T {
    get {
      <#code#>
    }
    set {
      <#code#>
    }
  }

}

//: [Next](@next)
