import SwiftUI

import Verge

struct VergeLogoView: View {

  var body: some View {
    Color(.systemPurple)
      .frame(width: 300, height: 300, alignment: .center)
      .clipShape(Circle())
  }
}

struct Preview_VergeLogoView: PreviewProvider {

  static var previews: some View {
    Group {
      VergeLogoView()
    }
  }
}
