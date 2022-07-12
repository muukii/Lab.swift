import PreviewLogger
import SwiftUI

let PreviewLog = PreviewLogger.PreviewLog.self

struct Book: View {

  var body: some View {
    VSplitView {
      NavigationView {

        List {

          NavigationLink("Reset") {

            Text("BBB")

          }
          
          NavigationLink("BookWeakify") {
            
            BookWeakify()
          }
          
          NavigationLink("BookRetrying") {
            
            BookRetrying()
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
      .frame(minWidth: 800, minHeight: 400)
      LogView()
        .frame(minHeight: 50)
    }

  }

}
