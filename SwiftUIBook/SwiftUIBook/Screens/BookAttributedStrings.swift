import Foundation
import PreviewLogger
import SwiftUI

public func dumpString<T>(_ object: T) -> String {
  var dumpString = ""
  Swift.dump(object, to: &dumpString, name: "", indent: 2, maxDepth: .max, maxItems: .max)
  return dumpString
}

enum RainbowAttribute: CodableAttributedStringKey, MarkdownDecodableAttributedStringKey {
  enum Value: String, Codable, Hashable {
    case plain
    case fun
    case extreme
  }

  static var name: String = "rainbow"
}

enum CustomDecodingAttribute: AttributedStringKey, MarkdownDecodableAttributedStringKey {

  enum CodingKeys: String, CodingKey {
    //    case CustomDecoding
    case a
    //    case b
  }

  static func decodeMarkdown(from decoder: Decoder) throws -> Value {
    do {

      

      PreviewLog.debug(.default, "\(decoder.codingPath)")
      let container = try decoder.singleValueContainer()
      
      //      let value = try container.decode(String.self, forKey: .CustomDecoding)
      return Value()

    } catch {
      PreviewLog.debug(.default, "\(error)")
      return Value()
    }
  }

  //  static func decode(from decoder: Decoder) throws -> Value {
  //
  //    //    PreviewLog.debug(.default, "\(dumpString(decoder))")
  //
  //    do {
  //
  //      PreviewLog.debug(.default, "\(decoder.codingPath)")
  //      let container = try decoder.container(keyedBy: CodingKeys.self)
  ////      let value = try container.decode(String.self, forKey: .CustomDecoding)
  //      return Value()
  //
  //    } catch {
  //      PreviewLog.debug(.default, "\(error)")
  //      return Value()
  //    }
  //  }

  struct Value: Hashable {

  }

  static var name: String = "CustomDecoding"
}

extension AttributeScopes {
  struct CaffeAppAttributes: AttributeScope {
    let rainbow: RainbowAttribute
    let custom: CustomDecodingAttribute
  }

  var caffeApp: CaffeAppAttributes.Type { CaffeAppAttributes.self }
}

extension AttributeDynamicLookup {
  subscript<T: AttributedStringKey>(
    dynamicMember keyPath: KeyPath<AttributeScopes.CaffeAppAttributes, T>
  ) -> T {
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

    ThrowingGroup {

      let string = try { () -> AttributedString in
        let string = try AttributedString(
          markdown:
            "Good morning. ^[John](rainbow: 'fun') ^[Hoge](CustomDecoding: 'mmm', a: 'a', b: 'b')",
          including: \.caffeApp
        )
        
     
        for run in string.runs {

          print(run.rainbow)
          print(run.custom)

        }

        return string
      }()
      
      let jsonEncoder: JSONEncoder = {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        return jsonEncoder
      }()
   
      let jsonData = try jsonEncoder.encode(string)

      VStack {

        Text(string)
        ScrollView {
          Text(String(data: jsonData, encoding: .utf8) ?? "null")
            .font(.system(size: 8))
        }
        LogView()
      }
    } errorView: { error in
      ZStack {
        Color.red
          .ignoresSafeArea(.all)
        Text("Error \(error.localizedDescription)")
          .foregroundColor(.white)
          .padding()
      }
    }

  }

}
