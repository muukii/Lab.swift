//
//  GeometricPatternGrid.swift
//  AppUIKit
//
//  Created by Muukii on 2021/02/19.
//

import SwiftUI

struct GeometricPatternGrid: View {
  var body: some View {
    
    VStack(spacing: 0) {
      ForEach(0..<6, content: { (i) in
        HStack(spacing: 0) {
          ForEach(0..<6, content: { (i) in
            Shape()
              .frame(width: 60, height: 60, alignment: .center)
              .foregroundColor(.gray)
              .id(i)
          })
        }
      })
    }
    
  }
  
  struct Shape: View {
    var body: some View {
      GeometryReader { proxy in
        Circle()
          .frame(width: proxy.size.height * 2, height: proxy.size.height * 2, alignment: .center)
      }
      .clipped()
      .rotationEffect(.init(degrees: 90))
    }
  }
}

struct GeometricPatternGrid_Previews: PreviewProvider {
  static var previews: some View {
    GeometricPatternGrid()
  }
}
