//: [Previous](@previous)

import Foundation

final class FilterStorage {

  private var storage: [String: Any] = [:]

  func comparer<T>(for key: String) -> ((T) -> Bool)? {
    guard let object = storage[key] else {
      return nil
    }

    return object as? ((T) -> Bool)
  }

  func setComaprer<T>(_ comparer: @escaping (T) -> Bool, for key: String) {
    storage[key] = comparer
  }

}

func _doIfChanged<T>(
  usingStorage: FilterStorage,
  key: String,
  value: T,
  compare: @escaping (T, T) -> Bool,
  perform: @escaping (T) -> Void
) {

  defer {

    let nextIsEqual: (T) -> Bool = { newValue in
      compare(value, newValue)
    }

    usingStorage.setComaprer(nextIsEqual, for: key)

  }

  guard let isEqual: (T) -> Bool = usingStorage.comparer(for: key) else {
    perform(value)
    return
  }

  guard isEqual(value) == false else {
    return
  }

  perform(value)

}

private var _storageKey: Void?

extension NSObject {

  private var storage: FilterStorage {

    objc_sync_enter(self)
    defer {
      objc_sync_exit(self)
    }

    if let associated = objc_getAssociatedObject(self, &_storageKey)
      as? FilterStorage
    {
      return associated
    } else {
      let associated = FilterStorage()
      objc_setAssociatedObject(self, &_storageKey, associated, .OBJC_ASSOCIATION_RETAIN)
      return associated
    }

  }

  public func doIfChanged<T>(
    file: StaticString = #file,
    line: UInt = #line,
    column: UInt = #column,
    value: T,
    compare: @escaping (T, T) -> Bool,
    perform: @escaping (T) -> Void
  ) {

    let key = "\(column).\(line).\(file)"

    _doIfChanged(
      usingStorage: storage,
      key: key,
      value: value,
      compare: compare,
      perform: perform
    )

  }

  public func doIfChanged<T: Equatable>(
    file: StaticString = #file,
    line: UInt = #line,
    column: UInt = #column,
    value: T,
    perform: @escaping (T) -> Void
  ) {

    let key = "\(column).\(line).\(file)"

    _doIfChanged(
      usingStorage: storage,
      key: key,
      value: value,
      compare: ==,
      perform: perform
    )

  }

}

import UIKit

class MyView: UIView {

  func run(value: Int) {
    view.doIfChanged(value: value) { v in
      print("😲 \(value)")
    }

  }
}

let view = MyView()

view.run(value: 1)
view.run(value: 2)
view.run(value: 2)
//: [Next](@next)
