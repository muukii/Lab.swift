
import TabularData
import Foundation
import LetterCase

let data = try Data.init(contentsOf: URL(fileURLWithPath: "/Users/muukii/Downloads/events.csv"))

let options = CSVReadingOptions(hasHeaderRow: true, delimiter: ",")

let dataFrame = try DataFrame(
  csvData: data,
  options: options
)

for row in dataFrame.rows {
  let kind = row["画面種別"]
  let eventName = (row["Event Name"] as? String)
  let figmaURL = row["Figma URL"]
  let definition = row["Definition"]
  let propertyName = row["Propety Name"] // key was typo missing 'r' in Prope _r_ ty
        
  let code = #"""
    
  /**
    \#(kind ?? "")
    \#(eventName ?? "")
    \#(figmaURL ?? "")
    \#(eventName ?? "")
    \#(definition ?? "")
    \#(propertyName ?? "")
  */
  public static func \#(eventName?.normalized().letterCase(.lowerCamel) ?? "_missing_")() -> Self {
    .init(name: "\#(eventName ?? "_missing_")", attributes: nil)
  }
  """#
  
  print(code)
}

extension String {
    
  func normalized() -> String {
    self
      .replacingOccurrences(of: "_", with: " ")
      .replacingOccurrences(of: "-", with: " ")
  }
  
}
