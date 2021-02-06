
@dynamicMemberLookup
public struct Intersection2<S1, S2> {

  /**
   A backing value that compose Intersection value.
   To call methods, it's exposed.
   */
  public var _source1: S1

  /**
   A backing value that compose Intersection value.
   To call methods, it's exposed.
   */
  public var _source2: S2

  public init(_ source1: S1, _ source2: S2) {
    self._source1 = source1
    self._source2 = source2
  }

  public subscript <U>(dynamicMember keyPath: KeyPath<S1, U>) -> U {
    _source1[keyPath: keyPath]
  }

  public subscript <U>(dynamicMember keyPath: WritableKeyPath<S1, U>) -> U {
    _read {
      yield _source1[keyPath: keyPath]
    }
    _modify {
      yield &_source1[keyPath: keyPath]
    }
  }

  public subscript <U>(dynamicMember keyPath: KeyPath<S2, U>) -> U {
    _source2[keyPath: keyPath]
  }

  public subscript <U>(dynamicMember keyPath: WritableKeyPath<S2, U>) -> U {
    _read {
      yield _source2[keyPath: keyPath]
    }
    _modify {
      yield &_source2[keyPath: keyPath]
    }
  }
}

extension Intersection2: Equatable where S1: Equatable, S2: Equatable {

}

extension Intersection2: Hashable where S1: Hashable, S2: Hashable {

}

@dynamicMemberLookup
public struct Intersection3<S1, S2, S3> {

  /**
   A backing value that compose Intersection value.
   To call methods, it's exposed.
   */
  public var _source1: S1

  /**
   A backing value that compose Intersection value.
   To call methods, it's exposed.
   */
  public var _source2: S2

  /**
   A backing value that compose Intersection value.
   To call methods, it's exposed.
   */
  public var _source3: S3

  public init(_ source1: S1, _ source2: S2, _ source3: S3) {
    self._source1 = source1
    self._source2 = source2
    self._source3 = source3
  }

  public subscript <U>(dynamicMember keyPath: KeyPath<S1, U>) -> U {
    _source1[keyPath: keyPath]
  }

  public subscript <U>(dynamicMember keyPath: WritableKeyPath<S1, U>) -> U {
    _read {
      yield _source1[keyPath: keyPath]
    }
    _modify {
      yield &_source1[keyPath: keyPath]
    }
  }

  public subscript <U>(dynamicMember keyPath: KeyPath<S2, U>) -> U {
    _source2[keyPath: keyPath]
  }

  public subscript <U>(dynamicMember keyPath: WritableKeyPath<S2, U>) -> U {
    _read {
      yield _source2[keyPath: keyPath]
    }
    _modify {
      yield &_source2[keyPath: keyPath]
    }
  }
}

extension Intersection3: Equatable where S1: Equatable, S2: Equatable, S3: Equatable {

}

extension Intersection3: Hashable where S1: Hashable, S2: Hashable, S3: Hashable {

}


struct A {
  var name: String
}

struct B {
  var age: Int
}

typealias User = Intersection2<A, B>

extension User {
  init(name: String, age: Int) {
    self.init(.init(name: name), .init(age: age))
  }
}

var value = User(name: "Muuk", age: 18)

print(value)

value.name
value.age

value.name = "J"
value.age = 32

