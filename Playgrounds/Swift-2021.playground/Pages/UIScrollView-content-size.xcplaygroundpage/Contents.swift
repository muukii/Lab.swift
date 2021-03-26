//: [Previous](@previous)

import UIKit

let scrollView = UIScrollView()
let imageView = UIImageView(frame: .zero)

PT.assert(scrollView.contentSize == .zero)

scrollView.addSubview(imageView)

PT.assert(scrollView.contentSize == .zero)

imageView.bounds = .init(origin: .zero, size: .init(width: 100, height: 400))

PT.assert(scrollView.contentSize == .zero)

scrollView.frame.size = .init(width: 300, height: 300)

PT.assert(scrollView.contentSize == .zero)

//: [Next](@next)
