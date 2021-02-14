import SwiftUI

struct MaterialShadow: View {
  
  var body: some View {
    Circle()
      .frame(width: 200, height: 200, alignment: .center)
  }
}

enum Preview_MaterialShadow: PreviewProvider {
  
  static var previews: some View {
    
    Group {
      MaterialShadow()
    }
  }
  
}

