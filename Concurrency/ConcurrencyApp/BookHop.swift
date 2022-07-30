
import Foundation
import SwiftUI

struct BookHop: View {
  
  var body: some View {
    
    Button("Run") {
      Task { @MainActor in
        
        print("👨🏻 1")
        
        await MainActor.run {
          print("👨🏻 2")
        }
        
        print("👨🏻 3")
        print("👨🏻 4")
        print("👨🏻 5")
        print("👨🏻 6")
      }
    }
    
  }
  
}
