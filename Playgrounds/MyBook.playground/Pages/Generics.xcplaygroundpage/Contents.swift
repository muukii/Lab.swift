import UIKit

struct Box<Value: CustomStringConvertible> {
  
  let value: Value
  
  var text: String {
    value.description
  }
}

let box = Box(value: 10)

Box(value: "hello")
Box(value: 10.0)
Box(value: UIView())

box.text
