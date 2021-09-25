//
//  ContentView.swift
//  static-library-play
//
//  Created by Muukii on 2021/09/25.
//

import SwiftUI
import ModularA
import NonModularB

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {

              print(String(reflecting: self))
              print(String(reflecting: __ModularA()))
              print(String(reflecting: __NonModularB()))

              print(String(reflecting: ModularA.Muukii()))
              print(String(reflecting: NonModularB.Muukii()))

            }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
