import os
import Dispatch

print(OSSignpostID.exclusive)
print(OSSignpostID.exclusive)
print(OSSignpostID.exclusive)

let log1 = OSLog(subsystem: "app.muukii", category: "performance1")
let log2 = OSLog(subsystem: "app.muukii2", category: "performance2")

print(OSSignpostID(log: log1))
print(OSSignpostID(log: log1))
print(OSSignpostID(log: log1))
print(OSSignpostID(log: log1))

print(OSSignpostID(log: log2))

DispatchQueue.concurrentPerform(iterations: 1000) { (i) in
  print(OSSignpostID(log: log1))
}
