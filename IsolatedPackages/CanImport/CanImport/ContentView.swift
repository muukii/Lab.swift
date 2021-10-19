//
//  ContentView.swift
//  CanImport
//
//  Created by Muukii on 2021/09/29.
//

import SwiftUI

#if canImport(MyModule)
#warning("Can import")
#else
#warning("Can not import")
#endif

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
