import Foundation

let dates: [Date] = [
  Date.init(timeIntervalSinceNow: -1000),
  Date(),
]

dates

dates.sorted(by: >).first
