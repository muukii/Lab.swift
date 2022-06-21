import Foundation

NSSetUncaughtExceptionHandler { e in
  print(e)
}

public struct Run {
  public let text: String
  public let rawAttributes: String
}

func parse(
  _ markdownString: String,
  handler: (Run) -> NSAttributedString
) -> NSMutableAttributedString {

  enum Expressions {
    static let custom = try! NSRegularExpression(pattern: #"\^\[(.*?)\]\((.*?)\)"#, options: [])
  }

  enum Static {
    static let decoder: JSONDecoder = {
      let decoder = JSONDecoder()
      if #available(iOS 15, *) {
        decoder.allowsJSON5 = true
      }
      return decoder
    }()
  }

  let nsMarkdownString = (markdownString as NSString)

  let results = Expressions.custom.matches(
    in: markdownString,
    range: NSRange(0..<markdownString.count)
  )

  let mutableString = NSMutableAttributedString(string: markdownString)

  var runs: [Run] = []
  var index = 0
  
  for markdownString
  
  
//  for result in results {
//
//    if result.numberOfRanges == 3 {
//
//      let range = result.range
//
//      runs.append(
//        Run(
//          text: nsMarkdownString.substring(
//            with: NSRange(location: index, length: range.lowerBound - 1)
//          ),
//          rawAttributes: ""
//        )
//      )
//
//      index = range.upperBound + 1
//
//      let label = nsMarkdownString.substring(with: result.range(at: 1))
//      let attributesRawString = nsMarkdownString.substring(with: result.range(at: 2))
//
//      runs.append(
//        Run(text: label, rawAttributes: attributesRawString)
//      )
//
//    } else {
//
//      // error
//    }
//
//  }
//
  print(runs)

  return mutableString
}

let result = parse("Hello ^[John](action) ^[John](help)") { run in
  NSAttributedString(string: run.text)
}

result
