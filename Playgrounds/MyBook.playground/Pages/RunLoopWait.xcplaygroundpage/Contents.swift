
import Foundation

func perform(completion: @escaping () -> Void) {
  DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
    completion()
  }
}

print("start")
perform {
  print("done")
}
RunLoop.main.run()
print("end")

