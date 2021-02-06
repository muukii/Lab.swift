//: [Previous](@previous)

enum MyCase: CaseIterable {
  case a
  case b
  case c
}

struct PatternGenerator<Pattern> {
  
  typealias Element = Pattern
    
  let generate: ((Pattern) -> Void) -> Void
  
  init(_ generate: @escaping ((Pattern) -> Void) -> Void) {
    self.generate = generate
  }
  
  func patterns() -> [Pattern] {
    var buffer = [Pattern]()
    generate {
      buffer.append($0)
    }
    return buffer
  }
  
}

extension PatternGenerator {
  
  static func from<P1: Sequence>(_ p1: P1) -> PatternGenerator<Pattern> where Pattern == P1.Element {
    return .init { (emit) in
      p1.forEach {
        emit($0)
      }
    }
  }
  
  static func from<P1: Sequence, P2: Sequence>(_ p1: P1, _ p2: P2) -> PatternGenerator<Pattern> where Pattern == (P1.Element, P2.Element) {
    .init { (emit) in
      p1.forEach { p1 in
        p2.forEach { p2 in
          emit((p1, p2))
        }
      }
    }
  }
  
  static func from<P1: Sequence, P2: Sequence, P3: Sequence>(_ p1: P1, _ p2: P2, _ p3: P3) -> PatternGenerator<Pattern> where Pattern == (P1.Element, P2.Element, P3.Element){
    .init { (emit) in
      p1.forEach { p1 in
        p2.forEach { p2 in
          p3.forEach { p3 in
            emit((p1, p2, p3))
          }
        }
      }
    }
  }
  
}

let gen = PatternGenerator.from([1,2,3], "I am", "Hiroshi.")

print(gen.patterns().map { "\($0)" }.joined(separator: "\n"))

//: [Next](@next)
