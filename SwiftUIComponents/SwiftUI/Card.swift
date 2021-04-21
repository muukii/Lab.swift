//
//  Card.swift
//  SwiftUIComponents
//
//  Created by Muukii on 2021/04/21.
//

import SwiftUI

enum Card_1619012242: PreviewProvider {

  static var previews: some View {
    Group {
      OneTimeAnimationView(title: "Matched") { wasAnimated, namespace in
        HStack {
          VStack {
            Text("Hello")
              .font(.title2)
            Spacer()
          }
          VStack {
            if wasAnimated {
              ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                  .matchedGeometryEffect(id: "1", in: namespace)
                  .foregroundColor(.init(white: 0, opacity: 0.6))
                  .frame(width: 100)
                  .offset(x: 30.0, y: 0)
                  .aspectRatio(3 / 4, contentMode: .fit)
                RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                  .matchedGeometryEffect(id: "2", in: namespace)
                  .foregroundColor(.init(white: 0, opacity: 0.6))
                  .frame(width: 120)
                  .offset(x: 40.0, y: 0)
                  .aspectRatio(3 / 4, contentMode: .fit)
                RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                  .matchedGeometryEffect(id: "3", in: namespace)
                  .foregroundColor(.init(white: 0, opacity: 0.6))
                  .aspectRatio(3 / 4, contentMode: .fit)
                  .frame(width: 140)
                  .offset(x: 200, y: 0)
              }
            } else {
              ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                  .matchedGeometryEffect(id: "1", in: namespace)
                  .foregroundColor(.init(white: 0, opacity: 0.6))
                  .aspectRatio(3 / 4, contentMode: .fit)
                  .frame(width: 80)
                  .offset(x: 0.0, y: 0)
                RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                  .matchedGeometryEffect(id: "2", in: namespace)
                  .foregroundColor(.init(white: 0, opacity: 0.6))
                  .aspectRatio(3 / 4, contentMode: .fit)
                  .frame(width: 100)
                  .offset(x: 10.0, y: 0)
                RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                  .matchedGeometryEffect(id: "3", in: namespace)
                  .foregroundColor(.init(white: 0, opacity: 0.6))
                  .aspectRatio(3 / 4, contentMode: .fit)
                  .frame(width: 120)
                  .offset(x: 20, y: 0)
              }

            }
            Spacer()
          }
          .frame(maxWidth: 120)
        }

      }
    }.previewLayout(.fixed(width: 300, height: 300))
  }

}
