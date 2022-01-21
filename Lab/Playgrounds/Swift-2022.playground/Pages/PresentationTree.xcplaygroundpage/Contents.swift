import UIKit

class ModalViewController: UIViewController {}

do {

  let modalViewController = ModalViewController()
  modalViewController.modalPresentationStyle = .fullScreen

  let window = UIWindow()
  let rootViewController = UIViewController()
  let childViewController = UIViewController()
  rootViewController.addChild(childViewController)
  rootViewController.view.addSubview(childViewController.view)
  childViewController.didMove(toParent: rootViewController)
  window.rootViewController = rootViewController

  PT.assert(rootViewController.presentedViewController == nil)

  rootViewController.present(modalViewController, animated: false, completion: nil)

  PT.assert(rootViewController.presentedViewController != nil)
  PT.assert(childViewController.presentedViewController != nil)

}

do {

  let modalViewController = ModalViewController()
  modalViewController.modalPresentationStyle = .fullScreen

  let window = UIWindow()
  let rootViewController = UIViewController()
  let childViewController = UIViewController()
  rootViewController.addChild(childViewController)
  rootViewController.view.addSubview(childViewController.view)
  childViewController.didMove(toParent: rootViewController)
  window.rootViewController = rootViewController

  PT.assert(rootViewController.presentedViewController == nil)

  childViewController.present(modalViewController, animated: false, completion: nil)

  PT.assert(rootViewController.presentedViewController != nil)
  PT.assert(childViewController.presentedViewController != nil)

}

do {

  let modalViewController = ModalViewController()
  modalViewController.modalPresentationStyle = .currentContext

  let window = UIWindow()
  let rootViewController = UIViewController()
  let childViewController = UIViewController()
  childViewController.definesPresentationContext = true
  rootViewController.addChild(childViewController)
  rootViewController.view.addSubview(childViewController.view)
  childViewController.didMove(toParent: rootViewController)

  window.rootViewController = rootViewController

  PT.assert(rootViewController.presentedViewController == nil)
  PT.assert(childViewController.presentedViewController == nil)

  childViewController.present(modalViewController, animated: false, completion: nil)

  PT.assert(rootViewController.presentedViewController == nil)
  PT.assert(childViewController.presentedViewController != nil)
  PT.assert(modalViewController.presentingViewController == childViewController)

  childViewController.dismiss(animated: false, completion: {
    PT.assert(rootViewController.presentedViewController == nil)
    PT.assert(childViewController.presentedViewController == nil)
  })

}


do {

  let modalViewController = ModalViewController()
  modalViewController.modalPresentationStyle = .fullScreen

  let window = UIWindow()
  let rootViewController = UIViewController()
  let childViewController = UIViewController()
  childViewController.definesPresentationContext = true
  rootViewController.addChild(childViewController)
  rootViewController.view.addSubview(childViewController.view)
  childViewController.didMove(toParent: rootViewController)

  window.rootViewController = rootViewController

  PT.assert(rootViewController.presentedViewController == nil)

  childViewController.present(modalViewController, animated: false, completion: nil)

  PT.assert(rootViewController.presentedViewController != nil)
  PT.assert(childViewController.presentedViewController != nil)

}

