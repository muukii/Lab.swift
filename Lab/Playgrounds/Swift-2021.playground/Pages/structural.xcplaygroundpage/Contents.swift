//: [Previous](@previous)

import Foundation

typealias Anonymous = (String, Int)

typealias LabeledA = (name: String, age: Int)

typealias LabeledB = (a: String, b: Int)

typealias LabeledC = (_: String, _: Int)

do {
  let value: LabeledA = ("", 10)
//  value as LabeledB // ❌ compile error
}

do {
  let value: Anonymous = ("", 10)
  value as LabeledB
}

do {
  let value: LabeledA = ("", 10)
  value as Anonymous
}

do {
  let value: LabeledA = ("", 10)
  (value as Anonymous) as LabeledB
}

do {
  let value: LabeledA = ("", 10)
  (value as LabeledC)
}
