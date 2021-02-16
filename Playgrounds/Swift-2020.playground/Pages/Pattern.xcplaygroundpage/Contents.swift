//: [Previous](@previous)

import Foundation

struct Pattern<Element>: Sequence {

  typealias Iterator = Array<Element>.Iterator

  let elements: [[Int : Any]]
  let numberOfArgs: Int

  init(_ elements: [Element]) {
    self.numberOfArgs = 1
    self.elements = elements.map { [1 : $0] }
  }

  func makeIterator() -> Array<Element>.Iterator {
    return elements.makeIterator()
  }

  func combined<Another>(_ anotherPatternElements: [Another]) -> Pattern<(Element, Another)> {
    combined(.init(anotherPatternElements))
  }

  func combined<Another>(_ anotherPattern: Pattern<Another>) -> Pattern<(Element, Another)> {
    var combinedElements: [[Int : Any]] = []
    elements.forEach { e in
      anotherPattern.elements.forEach { a in
        combinedElements.append((e, a))
      }
    }
    return Pattern<(Element, Another)>.init(combinedElements)
  }

}

let p = Pattern([0, 1, 2])
  .combined(["a", "b", "c"])
  .combined(["Foo"])

print(p.map { $0 })

//: [Next](@next)
