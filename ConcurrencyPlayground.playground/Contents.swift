import Foundation
import PlaygroundSupport
import _Concurrency

//PlaygroundPage.current.needsIndefiniteExecution = true

Task.detached {
  print("Start", Thread.current)

  await Task.detached {
    print("Hello", Thread.current)
    sleep(2)
    print("Done")
  }
  .result

  print("h", Thread.current)
}
print("a")
