
import Foundation

class Node {
  let value: Int
  let children: [Node]
  
  init(_ value: Int, _ children: [Node]) {
    self.value = value
    self.children = children
  }
}

struct Line {
  var depth: Int
  var string: String
}

func renderTree<T>(
  root: T,
  value: (T) -> String,
  children: (T) -> [T]
) -> String {
  
  var lines: [Line] = []
  
  func renderTree(
    root: T,
    depth: Int
  ) {
    
    lines.append(.init(depth: depth, string: value(root)))
    
    for child in children(root) {
      
      renderTree(root: child, depth: depth + 1)
            
    }
            
  }
  
  renderTree(root: root, depth: 0)
  
  return lines.map { line in
    Array(repeating: " ", count: line.depth * 2).joined() + "├─ " + line.string
  }
  .joined(separator: "\n")
  
}

let node = Node(10, [
  Node(10, [
  ]),
  Node(10, [
    Node(10, [
    ]),
    Node(10, [
    ])
  ]),
  Node(10, [
  ])
])

let result = renderTree(root: node, value: \.value.description, children: \.children)

print(result)
