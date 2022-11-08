
import Foundation

func run() async {
  Thread.current
}

Task { @MainActor in
  Thread.current
  await run()
  Thread.current
}
