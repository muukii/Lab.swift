import Foundation
import UIKit

func renderOnelineDescription<S>(subject: S, properties: (S) -> [(String, String)]) -> String {
  
  func escapeNewlines(_ value: String) -> String {
    value.replacingOccurrences(of: "\n", with: "\\n")
  }
  
  let propertieLines = properties(subject)
    .map { "\(escapeNewlines($0.0)) = \(escapeNewlines($0.1))" }
  
  if type(of: subject) is AnyClass {
        
    let pointer = Unmanaged.passUnretained(subject as AnyObject).toOpaque()
    
    let hex = String(Int(bitPattern: pointer), radix: 16, uppercase: true)
    
    let values = CollectionOfOne("\(String(reflecting: type(of: subject))): 0x\(hex)") + propertieLines
           
    return "<\(values.joined(separator: "; "))>"
    
  } else {
                       
    let values = CollectionOfOne("\(String(reflecting: type(of: subject)))") + propertieLines
           
    return "<\(values.joined(separator: "; "))>"
  }
}

print(renderOnelineDescription(subject: "", properties: { _ in [] }))

print(renderOnelineDescription(subject: UIView(), properties: { _ in []}))

