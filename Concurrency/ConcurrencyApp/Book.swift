import SwiftUI

struct Book: View {

  var body: some View {

    NavigationView {
      
      List {
        
        NavigationLink("Reset") {
          
          Text("BBB")
          
        }

        NavigationLink("Continuation") {

          BookContiunation()
        }

      }
      
    }

  }

}
