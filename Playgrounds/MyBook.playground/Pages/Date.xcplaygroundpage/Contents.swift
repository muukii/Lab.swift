//: [Previous](@previous)

import Foundation
import SwiftDate

extension Region {
  
  public static let app = Region(
    calendar: Calendars.gregorian,
    zone: TimeZone.current,
    locale: Locale.current
  )
  
}


let region = Region(calendar: Calendars.gregorian, zone: TimeZone(identifier: "JST")!, locale: Locale.current)

let date = DateInRegion(region: region)

Calendar.current.timeZone

print(date)

//: [Next](@next)
