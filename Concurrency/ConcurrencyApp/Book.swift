import PreviewLogger
import SwiftUI
import ResultBuilderKit

let PreviewLog = PreviewLogger.PreviewLog.self

struct AnyNavigationLink: View {
  
  let title: String
  let destination: AnyView
  
  init<Destination: View>(_ title: String, @ViewBuilder content: () -> Destination) {
    self.title = title
    self.destination = AnyView(content())
  }
  
  var body: some View {
    NavigationLink(title) {
      destination
    }
  }
}

struct Book: View {

  var body: some View {
    VStack {
      Spinner()
      VSplitView {
      NavigationView {

        List {
          
          ForEach.inefficient(items: buildArray(elementType: AnyNavigationLink.self, {
            
            AnyNavigationLink("BookInheritance") {
              BookInheritance()
            }
            
            AnyNavigationLink("BookDispatchToActor") {
              BookDispatchToActor()
            }
            
            AnyNavigationLink("Reset") {
              
              Text("BBB")
              
            }
            
            AnyNavigationLink("BookWeakify") {
              
              BookWeakify()
            }
            
            AnyNavigationLink("BookRetrying") {
              
              BookRetrying()
            }
            
            AnyNavigationLink("Continuation") {
              
              BookContiunation()
            }
            
            AnyNavigationLink("ContinuationCancel") {
              BookContiunationCancel()
            }
            
            AnyNavigationLink("Algorithms") {
              BookAlgorithms()
            }
            
            AnyNavigationLink("BookAsyncSequence") {
              BookAsyncSequence()
            }
            
            AnyNavigationLink("Blocking") {
              BookBlocking()
            }
            
            AnyNavigationLink("Hop") {
              BookHop()
            }
            
            AnyNavigationLink("Compile") {
              BookCompile()
            }
            
            AnyNavigationLink("BookNonIsolated") {
              BookNonIsolated()
            }
            
          })) { view in
            view
          }
        
        }

      }
      .frame(minWidth: 800, minHeight: 400)
      LogView()
        .frame(minHeight: 50)
    }
    }
  }

}
