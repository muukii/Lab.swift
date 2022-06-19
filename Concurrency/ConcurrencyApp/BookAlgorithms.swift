import AsyncAlgorithms
import Foundation
import SwiftUI

struct BookAlgorithms: View {

  var body: some View {

    Button("Action") {

      let t = Task.detached { @MainActor in

        let sequence = [1, 2, 3].async.map {
          $0 * 2
        }

        for await value in sequence {
          print(value)
        }
        
      }
      
      t.cancel()
      
    }

  }

}
