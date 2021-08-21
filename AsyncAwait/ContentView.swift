//
//  ContentView.swift
//  AsyncAwait
//
//  Created by Muukii on 2021/06/09.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    Text("Hello, world!")
      .padding()
      .onAppear {

        let counter = Counter(value: 1)

        let task = detach {
          await counter.value
        }

        let task1 = async(priority: .background) {
          await counter.increment()
        }

        asyncDetached {
          print(await counter.increment())
        }

        asyncDetached {
          print(await counter.increment())
        }

      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

actor Counter {
  var value: Int

  init(value: Int) {
    self.value = value
  }

  func increment() -> Int {
    value = value + 1
    return value
  }
}
