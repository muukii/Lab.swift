import os

let start = mach_absolute_time()

// do something

let elapsedMTU = mach_absolute_time() - start
var timebase = mach_timebase_info()
if mach_timebase_info(&timebase) == 0 {
  let elapsed = Double(elapsedMTU) * Double(timebase.numer) / Double(timebase.denom)
  print("render took \(elapsed)")
}
else {
  print("timebase error")
}
