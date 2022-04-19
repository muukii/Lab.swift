import Foundation

func duration(seconds: Double) -> (hours: String, minutes: String) {

  // TODO: 119sec displays as 1min remaining.
  // might be better to dispaly as 2min remaining.
  let hours = max(0, Int(seconds / (60 /*minutes*/ * 60 /*seconds*/)))
  let minutes = max(0, Int((seconds.truncatingRemainder(dividingBy: 3600) / 60).rounded(.up)))

  return (String(format: "%d", hours), String(format: "%d", minutes))
}

duration(seconds: 120)
duration(seconds: 119)
duration(seconds: 80)
duration(seconds: 60)
duration(seconds: 59)
duration(seconds: 0)
