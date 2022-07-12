import Cocoa
import Foundation
import Hue
import SwiftUI
import swiftui_color
import Preview

let list = """
      3C49D6
      
      4656FC
      
      5F9FD9
      
      70BBFF
      
      7581FD
      
      8857D9
      
      94CCFF
      
      A066FF
      
      B88DFF
      
      B943B5
      
      CB414C
      
      D06529
      
      D33C79
      
      D94FD5
      
      E37CE0
      
      EF4C59
      
      F37A83
      
      F57730
      
      F8478E
      
      F89A65
      
      FA76AB
      """

let fragments  = Generator.gen(list: list)

let palette = NSColorList(name: "color-scheme")

for fragment in fragments {
  palette.setColor(fragment.color, forKey: fragment.name)
}

print(fragments)

try palette.write(to: URL(fileURLWithPath: "/Users/muukii/Desktop/color-scheme.clr"))
