import CoreGraphics
import QuartzCore

func renderCATransform3D(_ t: CATransform3D) -> String {

  return """
[\(t.m11), \(t.m12), \(t.m13), \(t.m14)]
[\(t.m21), \(t.m22), \(t.m23), \(t.m24)]
[\(t.m31), \(t.m32), \(t.m33), \(t.m34)]
[\(t.m41), \(t.m42), \(t.m43), \(t.m44)]
"""
}
