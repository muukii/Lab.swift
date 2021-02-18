//
//  MatrixView.swift
//  SwiftUIComponents
//
//  Created by Muukii on 2021/02/18.
//

import SwiftUI

struct MatrixView: View {
  var body: some View {
    GeometryReader { _ in
      VStack {
        ForEach(0..<30, content: { i in
          HStack {
            ForEach(0..<30, content: { i in
              DotView().id(i)
                .frame(width: 10, height: 10, alignment: .center)
            })
          }
        })
      }
      .compositingGroup()
    }
    
  }
}

struct DotView: View {
  
  var body: some View {
    Circle()
      .foregroundColor(.black)
//      .padding(10)
  }
}

struct MatrixView_Previews: PreviewProvider {
  static var previews: some View {
    MatrixView()
  }
}
