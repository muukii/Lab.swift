
import UIKit

@objc
protocol Restriction {
      
}

extension Restriction where Self : UIViewController {
  
//  @available(*, unavailable)
  var navigationController: UINavigationController? {
    fatalError()
  }
  
  @available(*, unavailable)
  var navigationController2: UINavigationController? {
    fatalError()
  }
  
  var foo: String {
    "a"
  }
  
}

class MyController: UIViewController, Restriction {}

let vc = MyController()

vc.navigationController
//vc.navigationController2
vc.foo
