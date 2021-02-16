//: [Previous](@previous)

import WebKit

let webview = WKWebView()

print(UIScrollView.ContentInsetAdjustmentBehavior.always.rawValue)
print(UIScrollView.ContentInsetAdjustmentBehavior.automatic.rawValue)
print(UIScrollView.ContentInsetAdjustmentBehavior.never.rawValue)

print(webview.scrollView.contentInsetAdjustmentBehavior.rawValue)

//: [Next](@next)
