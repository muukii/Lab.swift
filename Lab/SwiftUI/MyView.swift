
import SwiftUI

struct MyView: View {
  
  var body: some View {
    Text("What's up")
  }
}

enum Preview_MyView: PreviewProvider {
  
  static var previews: some View {
    
    Group {
      MyView()
    }
  }
  
}
