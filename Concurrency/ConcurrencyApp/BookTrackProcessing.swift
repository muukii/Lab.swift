import Foundation
import SwiftUI

struct BookTrackProcessing: View {

  var body: some View {

    Button("Action") {

      Task { @MainActor in
        await withTaskProcessingHandler { isProcessing in

        } operation: {

        }

      }

    }

  }

}

/// [Custom]
private func withTaskProcessingHandler(
  handler: @MainActor (Bool) async -> Void,
  operation: @MainActor () async throws -> Void
) async rethrows {
  fatalError()
}

@Sendable
private func run() {

}
