import simd
import Foundation
import CoreGraphics

stride(from: 0, to: 100, by: 1.0).map { $0 }

stride(from: 0, to: 100, by: 1.0).map { v in
  simd_smoothstep(0, 100, TimeInterval(v))
}

CGRect.null



