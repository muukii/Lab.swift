
import UIKit

class MyNavigationController: UINavigationController {
  
  var dependency: Void
  
  init(dependency: Void) {
    self.dependency = dependency
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}


