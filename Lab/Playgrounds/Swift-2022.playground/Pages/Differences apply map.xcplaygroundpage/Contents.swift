import Foundation

/*
 https://github.com/apple/swift/blob/main/stdlib/public/core/Diffing.swift
 https://github.com/apple/swift/blob/main/stdlib/public/core/CollectionDifference.swift
 */

var base = ["1", "2", "3"]

var source = [1, 2, 3]
var new = [1, 3, 4, 5]

let d = new.difference(from: source)
let nd = d.transform {
  $0.description
}

let newBase = base.applying(nd)!

print(newBase)

extension CollectionDifference {

  func transform<U>(_ transform: (ChangeElement) -> U) -> CollectionDifference<U> {

    let mapped = map { change -> CollectionDifference<U>.Change in
      switch change {
      case .insert(let offset, let element, let associatedWith):
        return .insert(offset: offset, element: transform(element), associatedWith: associatedWith)
      case .remove(let offset, let element, let associatedWith):
        return .remove(offset: offset, element: transform(element), associatedWith: associatedWith)
      }
    }

    return .init(mapped)!

  }

}
