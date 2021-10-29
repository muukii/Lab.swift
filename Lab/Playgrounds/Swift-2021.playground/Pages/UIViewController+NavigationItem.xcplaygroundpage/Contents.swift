import UIKit

let vc = UIViewController()

print(vc.navigationItem)

vc.navigationItem.title
vc.navigationItem.titleView
vc.navigationItem.prompt
vc.navigationItem.leftBarButtonItem
vc.navigationItem.leftBarButtonItems
vc.navigationItem.rightBarButtonItem
vc.navigationItem.rightBarButtonItems

let navigationItem = vc.navigationItem

let token = navigationItem.observe(\.prompt, options: [.new]) { item, change in
  print("title")
}

navigationItem.prompt = "H"

withExtendedLifetime(token, {})
