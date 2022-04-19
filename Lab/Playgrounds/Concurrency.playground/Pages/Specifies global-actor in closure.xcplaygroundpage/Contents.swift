
import Foundation
import _Concurrency

@MainActor
func mainRun() {
}

func run(_ closure: @escaping () async -> Void) {
  
}

run { @MainActor in
  mainRun()
}

run {
  mainRun()
}

Task {
  mainRun()
}

Task { @MainActor in
  mainRun()
}
