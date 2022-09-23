import Foundation
import SwiftUI

struct BookTrackProcessing: View {
  
  var body: some View {
    
    Button("Action") {
      
      Task { @Sendable in
        await withTaskProcessingHandler { isProcessing in
          
        } operation: {
          
        }
        
        await withTaskCancellationHandler { @Sendable in
          
        } operation: { @Sendable in
          
        }

      }

    }
    
  }
  
}

/// [Custom]
private func withTaskProcessingHandler(handler: (Bool) async -> Void, operation: () async throws -> Void) async rethrows -> Void {
  fatalError()
}

@Sendable
private func run() {
  
}
