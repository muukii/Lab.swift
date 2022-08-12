import Foundation
import SwiftUI

struct BookTrackProcessing: View {
  
  var body: some View {
    
    Button("Action") {
      
      Task {
        withTaskProcessingHandler { isProcessing in
          
        } operation: {
          
        }
        
        await withTaskCancellationHandler {
          
        } operation: {
          
        }

      }

    }
    
  }
  
}

/// [Custom]
private func withTaskProcessingHandler(handler: (Bool) async -> Void, operation: () async throws -> Void) rethrows -> Void {
  fatalError()
}
