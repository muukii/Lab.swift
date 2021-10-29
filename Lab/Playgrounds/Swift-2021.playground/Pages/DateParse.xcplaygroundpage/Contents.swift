//: [Previous](@previous)

import Foundation
import SwiftDate

do {
  
  let formatter = Foundation.ISO8601DateFormatter()
  formatter.date(from: "2018-11-07T00:25:00.073876Z")
  
  let str1 = "2018-11-07T00:25:00.073876Z"
  let str2 = "2018-11-07T00:25:00.073886Z"
  let date1 = str1.toISODate()!
  print(date1.timeIntervalSince1970)
  let date2 = str2.toISODate()!
  print(date2.timeIntervalSince1970)
  
  PT.assertEqual(date1, date2)

}

Double("1541550300,073876")

String(Double("0.1")!.bitPattern, radix: 2, uppercase: true)
String((Double("0.1")! + Double("0.2")!).bitPattern, radix: 2, uppercase: true)
String((Double("0.3")!).bitPattern, radix: 2, uppercase: true)

PT.assertEqual(Double("1541550300.073876"), Double("1541550300.073886"))


//: [Next](@next)
