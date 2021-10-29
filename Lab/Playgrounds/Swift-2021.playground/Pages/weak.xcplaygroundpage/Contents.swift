import Dispatch
import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class Object {
  deinit {
    print("deinit")
  }
}

class Controller {

  var instances: [Any] = []
  var closures: [() -> Void] = []

  func run() {

    let prepare = { [unowned self] in

      print("prepare", self)

      self.closures.append { [self] in
        print("try to print self")
        let a = self
        print(a)
//        self.instances.append { [weak self] in
//          print(self)
//        }
      }

    }

    instances.append(prepare)

//    prepare()
//
//    closures.forEach { $0() }
  }

  deinit {
    print("deinit", self)
  }

}



//closures.forEach { $0() }
//
//object = nil
//
//closures.forEach { $0() }

var c: Controller! = Controller()

c.run()

c = nil

print("end")
