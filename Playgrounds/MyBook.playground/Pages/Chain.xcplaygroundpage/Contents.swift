//: [Previous](@previous)

import Foundation
import UIKit

// MARK: - Library

public protocol _Chain_OptionalProtocol {
  associatedtype Wrapped
  var _chain_wrapped: Wrapped? { get }
}

extension Optional: _Chain_OptionalProtocol {
  public var _chain_wrapped: Wrapped? {
    self
  }
}


postfix operator &

@_disfavoredOverload
postfix func & <T>(argument: T) -> Chain<T> {
  .init(argument)
}

postfix func & <T>(argument: inout T) -> Void {
  withUnsafeMutablePointer(to: &argument) { (pointer) -> Void in
    print(pointer)
  }
}

public struct Chain<Value> {

  public let value: Value

  public init(_ value: Value) {
    self.value = value
  }

  public func map<U>(_ transform: (Value) throws -> U) rethrows -> Chain<U> {
    .init(try transform(value))
  }

  public func flatMap<U>(_ transform: (Value) throws -> Chain<U>) rethrows -> Chain<U> {
    .init(try transform(value).value)
  }

  public func `do`(_ applier: (Value) throws -> Void) rethrows -> Chain<Value> {
    try applier(value)
    return self
  }

  public func filter(_ filter: (Value) -> Bool) -> Chain<Value?> {
    guard filter(value) else {
      return .init(nil)
    }
    return .init(value)
  }

  public func ifEmpty(_ fallbackValue: Value.Wrapped) -> Chain<Value.Wrapped> where Value : _Chain_OptionalProtocol {
    if let wrapped = self.value._chain_wrapped {
      return .init(wrapped)
    }
    return .init(fallbackValue)
  }

}

public struct Modifier<Value> {
  
  public let value: Value
  
  public init(_ value: Value) {
    self.value = value
  }
 
}

// MARK: - Usage

let result = ""&.map { Int($0) }.do { print($0 as Any) }.value

let value = ""&.filter { !$0.isEmpty }.ifEmpty("b").value
value

let view = UIView()&.do {
  $0.backgroundColor = .white
}.value

var v = ""

let a = v&

let b = String("")&

//: [Next](@next)
