//: [Previous](@previous)

import UIKit

let controller = UIViewController()

PT.assert(controller.presentationController != nil)

controller.presentationController!.presentingViewController
//print(controller.presentationController!.presentingViewController)

PT.assert(controller.presentationController!.presentedViewController == controller)


//: [Next](@next)
