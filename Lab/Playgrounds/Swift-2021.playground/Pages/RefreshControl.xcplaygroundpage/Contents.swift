
import UIKit

let refreshControl = UIRefreshControl()

refreshControl.addAction(.init { _ in
  print("action")
}, for: .valueChanged)

refreshControl.beginRefreshing()
