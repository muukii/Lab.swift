//
//  ContentView.swift
//  LocalizedStrings
//
//  Created by Muukii on 2021/09/26.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    Form {
      Text(
        Strings(
          ja: "日本語 {{ name }}",
          ko: "韓国語　{{ name }}",
          zh_Hant: "中国語 {{ name }}"
        ).string(
            parameters: [
              "name": "muukii"
            ]
          )
      )
      Text(LocalizedStringKey("language"))
      Text("\(Locale.preferredLanguages.description)")
      Text("\(UserDefaults.standard.value(forKey: "AppleLanguages").debugDescription)")
      Text("\(Locale.isoLanguageCodes.debugDescription)")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
