//: [Previous](@previous)

import Foundation

struct Link {
  var title: String
  var urlString: String
}

let links: [Link] = [
  .init(title: "Hello", urlString: "https://google.com")
]

var lines: [String] = []
lines.append("<ul>")

for link in links {
  lines.append("<li>")
  lines.append(#"<a href="\#(link.urlString)">\#(link.title)</a>"#)
  lines.append("</li>")
}

lines.append("</ul>")

let html = lines.joined(separator: "\n")
print(html)

//: [Next](@next)
