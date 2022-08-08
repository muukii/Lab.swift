import SwiftUI

extension ForEach where Data == Range<Int>, ID == Int, Content: View {
  
  /**
   For just displaying particularly prototyping.
   Not for suitable in production.
   */
  public static func inefficient<Item>(items: [Item], @ViewBuilder body: @escaping (Item) -> Content) -> ForEach {
    ForEach(items.indices, id: \.self) { index in
      body(items[index])
    }
  }
  
}
