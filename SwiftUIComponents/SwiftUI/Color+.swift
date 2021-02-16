import SwiftUI

extension Color {
  public init(
    _ colorSpace: Color.RGBColorSpace = .sRGB,
    hexInt: Int,
    alpha: Double = 1
  ) {
    self = Color(
      colorSpace,
      red: Double((hexInt & 0x00FF_0000) >> 16) / 255,
      green: Double((hexInt & 0x0000_FF00) >> 8) / 255,
      blue: Double((hexInt & 0x0000_00FF) >> 0) / 255,
      opacity: alpha
    )
  }
}
