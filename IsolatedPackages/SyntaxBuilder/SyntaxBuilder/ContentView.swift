//
//  ContentView.swift
//  SyntaxBuilder
//
//  Created by Muukii on 2021/10/24.
//

import SwiftUI
import SwiftSyntax

struct ContentView: View {
    var body: some View {
      Button("Run") {
        Playground.run()
      }
      .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
