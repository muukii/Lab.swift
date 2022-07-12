import Cocoa
import SwiftUI
import swiftui_color

public enum Generator {

  public struct Fragment: Identifiable {

    public var id: String {
      name
    }

    public let name: String
    public let color: NSColor

    public var swiftUIColor: Color {
      Color.init(nsColor: color)
    }
  }

  public static func gen(list: String) -> [Fragment] {

    let fragments =
      list
      .split(separator: "\n")
      .map { String($0) }
      .filter { $0.isEmpty == false }
      .map { hex -> [Fragment] in

        let baseColor = NSColor(cgColor: Color.init(.displayP3, hexString: hex).cgColor!)!

        let name = hex

        return [
//          Fragment(
//            name: name + "-",
//            color: baseColor.add(hue: 0, saturation: 0, brightness: 0, alpha: 0)
//          ),
          Fragment(name: name, color: baseColor),
//          Fragment(
//            name: name + "+",
//            color: baseColor.add(hue: 0, saturation: 0, brightness: 0, alpha: 0)
//          ),
        ]
      }
      .flatMap { $0 }

    return fragments
  }

}

extension NSColor {

  /**adds hue, saturation, and brightness to the HSB components of this color (self)*/
  func add(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> NSColor {
    var (oldHue, oldSat, oldBright, oldAlpha): (CGFloat, CGFloat, CGFloat, CGFloat) = (0, 0, 0, 0)
    self.getHue(&oldHue, saturation: &oldSat, brightness: &oldBright, alpha: &oldAlpha)

    // make sure new values doesn't overflow
    var newHue = oldHue + hue
    while newHue < 0.0 { newHue += 1.0 }
    while newHue > 1.0 { newHue -= 1.0 }

    let newBright: CGFloat = max(min(oldBright + brightness, 1.0), 0)
    let newSat: CGFloat = max(min(oldSat + saturation, 1.0), 0)
    let newAlpha: CGFloat = max(min(oldAlpha + alpha, 1.0), 0)
    
    return NSColor(
      colorSpace: colorSpace,
      hue: newHue,
      saturation: newBright,
      brightness: newSat,
      alpha: newAlpha
    )
  }

  func toSRGB() -> NSColor {

    let converted = cgColor.converted(
      to: .init(name: CGColorSpace.sRGB)!,
      intent: .defaultIntent,
      options: nil
    )!

    return .init(cgColor: converted)!
  }

}

extension CGColor {

  func hoge() {

  }

}
