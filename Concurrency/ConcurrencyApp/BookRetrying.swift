
import Foundation
import SwiftUI

struct BookRetrying: View {
  
  @State var message: String = ""
  
  var body: some View {
    
    Text(message)
    Button("Action") {
      Task {
        do {
          let result: Void = try await withRetrying(upTo: 2) {
            throw NSError(domain: "Ouch", code: 1)
          }
          message = "\(result)"
        } catch {
          message = error.localizedDescription
        }
      }
    }
    
  }
  
}

fileprivate func withRetrying<ReturnType>(upTo count: Int, task: () async throws -> ReturnType) async throws -> ReturnType {
  
  var index = 0
  var lastError: Error?
  
  while index < count {
    do {
      let result = try await task()
      return result
    } catch {
      lastError = error
      index += 1
    }
  }
  
  throw lastError!
}
