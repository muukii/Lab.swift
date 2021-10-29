
#if canImport(UIKit)
import UIKit

// imported from https://github.com/zenangst/Hue
extension UIColor {
  
  /// Constructing color from hex string
  ///
  /// - Parameter hex: A hex string, can either contain # or not
  public convenience init(hexSRGB string: String) {
    var hex = string.hasPrefix("#")
      ? String(string.dropFirst())
      : string
    guard hex.count == 3 || hex.count == 6
    else {
      self.init(white: 1.0, alpha: 0.0)
      return
    }
    if hex.count == 3 {
      for (index, char) in hex.enumerated() {
        hex.insert(char, at: hex.index(hex.startIndex, offsetBy: index * 2))
      }
    }
    guard let intCode = Int(hex, radix: 16) else {
      self.init(white: 1.0, alpha: 0.0)
      return
    }
    self.init(
      red:   CGFloat((intCode >> 16) & 0xFF) / 255.0,
      green: CGFloat((intCode >> 8) & 0xFF) / 255.0,
      blue:  CGFloat((intCode) & 0xFF) / 255.0, alpha: 1.0)
  }
  
  /// Constructing color from hex string
  ///
  /// - Parameter hex: A hex string, can either contain # or not
  public convenience init(hexP3 string: String, _unused_colorLiteral: UIColor? = nil) {
    var hex = string.hasPrefix("#")
      ? String(string.dropFirst())
      : string
    guard hex.count == 3 || hex.count == 6
    else {
      self.init(white: 1.0, alpha: 0.0)
      return
    }
    if hex.count == 3 {
      for (index, char) in hex.enumerated() {
        hex.insert(char, at: hex.index(hex.startIndex, offsetBy: index * 2))
      }
    }
    guard let intCode = Int(hex, radix: 16) else {
      self.init(white: 1.0, alpha: 0.0)
      return
    }
    
    self.init(
      displayP3Red: CGFloat((intCode >> 16) & 0xFF) / 255.0,
      green: CGFloat((intCode >> 8) & 0xFF) / 255.0,
      blue:  CGFloat((intCode) & 0xFF) / 255.0,
      alpha: 1.0
    )
  }
  
  /// Creates an instance of UIColor that uses P3 color space.
  ///
  /// - Parameters:
  ///   - sample: You can put the color literal to visualize color. Actually this parameter won't be used anywhere.
  public convenience init(intP3 hexInt: Int, alpha: CGFloat = 1, _unused_colorLiteral: UIColor? = nil) {
    self.init(
      displayP3Red: CGFloat((hexInt & 0x00FF_0000) >> 16) / 255,
      green: CGFloat((hexInt & 0x0000_FF00) >> 8) / 255,
      blue: CGFloat((hexInt & 0x0000_00FF) >> 0) / 255,
      alpha: alpha
    )
  }
  
  public func add(hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) -> UIColor {
    var (oldHue, oldSat, oldBright, oldAlpha) : (CGFloat, CGFloat, CGFloat, CGFloat) = (0,0,0,0)
    getHue(&oldHue, saturation: &oldSat, brightness: &oldBright, alpha: &oldAlpha)
    
    // make sure new values doesn't overflow
    var newHue = oldHue + hue
    while newHue < 0.0 { newHue += 1.0 }
    while newHue > 1.0 { newHue -= 1.0 }
    
    let newBright: CGFloat = max(min(oldBright + brightness, 1.0), 0)
    let newSat: CGFloat = max(min(oldSat + saturation, 1.0), 0)
    let newAlpha: CGFloat = max(min(oldAlpha + alpha, 1.0), 0)
    
    return UIColor(hue: newHue, saturation: newSat, brightness: newBright, alpha: newAlpha)
  }
}

#endif
