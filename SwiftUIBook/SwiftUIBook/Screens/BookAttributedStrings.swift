import Foundation
import SwiftUI

enum RainbowAttribute: CodableAttributedStringKey, MarkdownDecodableAttributedStringKey {
  enum Value: String, Codable, Hashable {
    case plain
    case fun
    case extreme
  }
  
  static var name: String = "rainbow"
}

extension AttributeScopes {
  struct CaffeAppAttributes: AttributeScope {
    let rainbow: RainbowAttribute
  }
  
  var caffeApp: CaffeAppAttributes.Type { CaffeAppAttributes.self }
}

extension AttributeDynamicLookup {
  subscript<T: AttributedStringKey>(dynamicMember keyPath: KeyPath<AttributeScopes.CaffeAppAttributes, T>) -> T {
    self[T.self]
  }
}

struct BookAttributedStrings: View, PreviewProvider {
  
  static var previews: some View {
    Group {
      self.init()
    }
  }
  
  var body: some View {
    
    let string = try! AttributedString(markdown: "Good morning sir", including: \.caffeApp)
    
    return Text(string)
  }
  
}

