import UIKit

let view = UIView()
let controller = UIViewController()

view == controller

func isEqual<T: Equatable, S: Equatable>(_ lhs: T, _ rhs: S) -> Bool {
  type(of: T.self)
  return lhs == rhs
}

isEqual(view, controller)
