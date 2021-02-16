import UIKit

class MyNavigationController: UINavigationController {

  override var children: [UIViewController] {
    super.children
  }

  override var viewControllers: [UIViewController] {
    get {
      super.viewControllers
    }
    set {
      super.viewControllers = newValue
    }
  }
}

let nav = MyNavigationController()

nav.addChild(UIViewController())
nav.addChild(UIViewController())
nav.addChild(UIViewController())

//nav.children.count
//nav.viewControllers.count

nav.topViewController
nav.visibleViewController

nav.popViewController(animated: false)

nav.children.count
nav.viewControllers.count
