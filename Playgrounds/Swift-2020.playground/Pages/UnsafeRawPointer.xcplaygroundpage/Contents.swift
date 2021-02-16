import UIKit

var strongController: UIViewController? = UIViewController()

weak var controller: UIViewController? = strongController

let pointer = Unmanaged.passUnretained(controller!).toOpaque()

controller = nil

do {
  let c = unsafeBitCast(pointer, to: UIViewController.self)
  c.view
}

strongController = nil

do {
  let c = unsafeBitCast(pointer, to: UIViewController.self)
  c.view
}
