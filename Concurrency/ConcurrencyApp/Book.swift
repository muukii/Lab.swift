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
          
          ForEach.inefficient(items: build({
            BookClosure()
            BookUnsafeTask()
            BookInheritance()
            BookDispatchToActor()
            BookWeakify()
            BookRetrying()
            BookContiunation()
            BookContiunationCancel()
            BookAlgorithms()
            BookAsyncSequence()
            BookBlocking()
            BookHop()
            BookCompile()
            BookNonIsolated()
          }), body: { $0 })
                          
        }

      }
      .frame(minWidth: 800, minHeight: 400)
      LogView()
        .frame(minHeight: 50)
    }
    }
  }

}


func build(@BookLinksBuilder _ build: () -> [AnyNavigationLink]) -> [AnyNavigationLink] {
  build()
}

@resultBuilder
struct BookLinksBuilder {
  
  static func buildExpression<Content: View>(_ content: Content) -> AnyNavigationLink {
    .init(String(describing: type(of: content))) {
      content
    }
  }
  
  static func buildBlock(_ components: AnyNavigationLink...) -> [AnyNavigationLink] {
    components
  }

}
