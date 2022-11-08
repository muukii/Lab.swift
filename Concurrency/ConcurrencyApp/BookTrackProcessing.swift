import Foundation
import SwiftUI

struct BookTrackProcessing: View {

  var body: some View {

    Button("Action") {

      Task { @MainActor in
        
        await process()
        
        await withTaskProcessingHandler { isProcessing in
          print("")
        } operation: {
          print("hello")
        }

      }

    }

  }

}

fileprivate func process() async {
  print("h")
}

fileprivate func _process() {
  print("h")
}

/// [Custom]
public func withTaskProcessingHandler<T>(
  @_inheritActorContext handler: @Sendable (Bool) async -> Void,
  @_inheritActorContext operation: @Sendable () async throws -> T
) async rethrows -> T {

  do {

    await handler(true)
    let result = try await operation()
    await handler(false)

    return result
  } catch {

    await handler(false)
    throw error
  }
}

@Sendable
private func run() {

}
