import UIKit

let alertControler = UIAlertController(title: "", message: "", preferredStyle: .alert)

print(alertControler.presentationController)

let viewController = UIViewController()

viewController.modalPresentationStyle = .fullScreen

viewController.presentationController
