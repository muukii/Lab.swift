//
//  ContentView.swift
//  SwiftUIPlay
//
//  Created by Muukii on 2021/11/12.
//

import SwiftUI

struct ContentView: View {

  enum SheetContent: Identifiable {

    struct Foo: Identifiable {
      var id: String
    }

    var id: String {
      switch self {
      case .foo(let v): return "foo.\(v.id)"
      }
    }

    case foo(Foo)

  }

  @State var sheetContent: SheetContent?

  var body: some View {
    Button("Show") {
      sheetContent = .foo(.init(id: "add"))
    }
    .padding()
    .sheet(
      item: $sheetContent,
      onDismiss: {

      },
      content: { content in
        switch content {
        case .foo(let v):
          AddingView()
        }
    }
    )

  }

}

struct AddingView: View {

  @State var userID: String = ""

  var body: some View {
    Form {
      TextField("UserID", text: $userID, prompt: nil)
      Button("Create") {

      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
