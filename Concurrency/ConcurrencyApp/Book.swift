import SwiftUI
import PreviewLogger

let PreviewLog = PreviewLogger.PreviewLog.self

struct Book: View {

  var body: some View {
    VSplitView {
      NavigationView {
      
      List {
        
        NavigationLink("Reset") {
          
          Text("BBB")
          
        }

        NavigationLink("Continuation") {

          BookContiunation()
        }
        
        NavigationLink("ContinuationCancel") {
          BookContiunationCancel()
        }

        NavigationLink("Algorithms") {
          BookAlgorithms()
        }
        
        NavigationLink("BookAsyncSequence") {
          BookAsyncSequence()
        }
      }
      
    }
      .frame(width: 800, height: 400)
      LogView()
        .frame(minHeight: 50)
    }

  }

}
