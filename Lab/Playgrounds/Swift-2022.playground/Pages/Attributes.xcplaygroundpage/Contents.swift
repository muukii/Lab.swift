import Foundation

NSSetUncaughtExceptionHandler { e in
  print(e)
}

public struct Run {
    
  enum Static {
    static let decoder: JSONDecoder = {
      let decoder = JSONDecoder()
      if #available(iOS 15, *) {
        decoder.allowsJSON5 = true
      }
      return decoder
    }()
  }
  
  public let text: String
  public let rawAttributes: String
}

func parse(
  _ markdownString: String,
  handler: (Run) -> NSAttributedString
) {

  let scanner = Scanner(string: markdownString)
  
  var runs: [Run] = [] {
    didSet {
      print(runs)
    }
  }
  
  CharacterSet()

  while scanner.isAtEnd == false {
    
//    print(scanner.currentIndex.utf16Offset(in: markdownString))
    
    print(scanner.scanCharacter() ?? "")
//
//    if let string = scanner.scanUpToString("^[") {
//      // move cursor
//      scanner.scanString("^[")
//
//      runs.append(
//        Run(text: string, rawAttributes: "")
//      )
//
//      if let attributedText = scanner.scanUpToString("](") {
//        // move cursor
//        scanner.scanString("](")
//
//        if let attributesData = scanner.scanUpToString(")") {
//
//          print(scanner.currentIndex.utf16Offset(in: markdownString))
//
//          scanner.scanCharacters(from: .init(charactersIn: ")"))
//
//          runs.append(
//            Run(text: attributedText, rawAttributes: attributesData)
//          )
//
//        }
//
//      }
//
//    } else {
//      sleep(2)
//    }

  }
  
  print(runs.map { String(describing: $0)}.joined(separator: "\n"))

  print("done")
}

parse("Hello ? & % Hey^[John](action) ^[John](help) How are you?") { run in
  NSAttributedString(string: run.text)
}

//parse("    ") { run in
//  NSAttributedString(string: run.text)
//}
