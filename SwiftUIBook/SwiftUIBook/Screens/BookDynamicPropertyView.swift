import SwiftUI

struct BookDynamicPropertyView: View {
  
  var stateWrapper: StateWrapper = .init()
  
  var body: some View {
    let _: Void = { print("❗️ render") }()
    Text("H, \(stateWrapper.state)")
    Button("Update") {
      stateWrapper.state += 1
    }
  }
    
  struct StateWrapper: DynamicProperty {
    
    @State
    var state: Int = 0
        
  }
}

