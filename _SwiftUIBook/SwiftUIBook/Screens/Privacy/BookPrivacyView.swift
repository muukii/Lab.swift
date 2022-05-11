import SwiftUI

struct BookPrivacyView: View {
  var body: some View {
    VStack {
      Text("Account #")
      
      Text("080")
        .font(.headline)
        .privacySensitive() // Hide only the account number.
    }
    .redacted(reason: .privacy)
  }
}
