import Foundation

/// ...
/// a + b
func + (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

/// ...
/// a += b
func += (left: inout CGPoint, right: CGPoint) {
  left = left + right
}

/// ...
/// a -= b
func - (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

/// ...
/// a -= b
func -= (left: inout CGPoint, right: CGPoint) {
  left = left - right
}

/// ...
/// a * b
func * (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x * right.x, y: left.y * right.y)
}

/// ...
/// a *= b
func *= (left: inout CGPoint, right: CGPoint) {
  left = left * right
}

/// ...
/// a / b
func / (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x / right.x, y: left.y / right.y)
}

/// ...
/// a /= b
func /= (left: inout CGPoint, right: CGPoint) {
  left = left / right
}

/// ...
/// a * 10.4
func * (left: CGPoint, right: CGFloat) -> CGPoint {
  return CGPoint(x: left.x * right, y: left.y * right)
}

/// ...
/// a *= 10.4
func *= (left: inout CGPoint, right: CGFloat) {
  left = left * right
}

/// ...
/// a / 10.4
func / (left: CGPoint, right: CGFloat) -> CGPoint {
  return CGPoint(x: left.x / right, y: left.y / right)
}

/// ...
/// a /= 10.4
func /= (left: inout CGPoint, right: CGFloat) {
  left = left / right
}

/**
 * var c = CGSizeMake(20.4, 75.8)
 * ...
 */

/// ...
/// a + c
func + (left: CGPoint, right: CGSize) -> CGPoint {
  return CGPoint(x: left.x + right.width, y: left.y + right.height)
}

/// ...
/// a += c
func += (left: inout CGPoint, right: CGSize) {
  left = left + right
}

/// ...
/// a - c
func - (left: CGPoint, right: CGSize) -> CGPoint {
  return CGPoint(x: left.x - right.width, y: left.y - right.height)
}

/// ...
/// a -= c
func -= (left: inout CGPoint, right: CGSize) {
  left = left - right
}

/// ...
/// a * c
func * (left: CGPoint, right: CGSize) -> CGPoint {
  return CGPoint(x: left.x * right.width, y: left.y * right.height)
}

/// ...
/// a *= c
func *= (left: inout CGPoint, right: CGSize) {
  left = left * right
}

/// ...
/// a / c
func / (left: CGPoint, right: CGSize) -> CGPoint {
  return CGPoint(x: left.x / right.width, y: left.y / right.height)
}

/// ...
/// a /= c
func /= (left: inout CGPoint, right: CGSize) {
  left = left / right
}

/// ...
/// -a
prefix func - (left: CGPoint) -> CGPoint {
  return CGPoint(x: -left.x, y: -left.y)
}

/**
 * CGSize
 */

/**
 * var a = CGSizeMake(8.9, 14.5)
 * var b = CGSizeMake(20.4, 75.8)
 * ...
 */

/// ...
/// a + b
func + (left: CGSize, right: CGSize) -> CGSize {
  return CGSize(width: left.width + right.width, height: left.height + right.height)
}

/// ...
/// a += b
func += (left: inout CGSize, right: CGSize) {
  left = left + right
}

/// ...
/// a - b
func - (left: CGSize, right: CGSize) -> CGSize {
  return CGSize(width: left.width - right.width, height: left.height - right.height)
}

/// ...
/// a -= b
func -= (left: inout CGSize, right: CGSize) {
  left = left - right
}

/// ...
/// a * b
func * (left: CGSize, right: CGSize) -> CGSize {
  return CGSize(width: left.width * right.width, height: left.height * right.height)
}

/// ...
/// a *= b
func *= (left: inout CGSize, right: CGSize) {
  left = left * right
}

/// ...
/// a / b
func / (left: CGSize, right: CGSize) -> CGSize {
  return CGSize(width: left.width / right.width, height: left.height / right.height)
}

/// ...
/// a /= b
func /= (left: inout CGSize, right: CGSize) {
  left = left / right
}

/**
 * var c = CGPointMake(-3.5, -17.6)
 * ...
 */

/// ...
/// a + c
func + (left: CGSize, right: CGPoint) -> CGSize {
  return CGSize(width: left.width + right.x, height: left.height + right.y)
}

/// ...
/// a += c
func += (left: inout CGSize, right: CGPoint) {
  left = left + right
}

/// ...
/// a - c
func - (left: CGSize, right: CGPoint) -> CGSize {
  return CGSize(width: left.width - right.x, height: left.height - right.y)
}

/// ...
/// a -= c
func -= (left: inout CGSize, right: CGPoint) {
  left = left - right
}

/// ...
/// a * c
func * (left: CGSize, right: CGPoint) -> CGSize {
  return CGSize(width: left.width * right.x, height: left.height * right.y)
}

/// ...
/// a *= c
func *= (left: inout CGSize, right: CGPoint) {
  left = left * right
}

/// ...
/// a / c
func / (left: CGSize, right: CGPoint) -> CGSize {
  return CGSize(width: left.width / right.x, height: left.height / right.y)
}

/// ...
/// a /= c
func /= (left: inout CGSize, right: CGPoint) {
  left = left / right
}

/// ...
/// a * 4.6
func * (left: CGSize, right: CGFloat) -> CGSize {
  return CGSize(width: left.width * right, height: left.height * right)
}

/// ...
/// a *= 4.6
func *= (left: inout CGSize, right: CGFloat) {
  left = left * right
}

/// ...
/// a + b
func + (left: CGRect, right: CGPoint) -> CGRect {
  return CGRect(
    x: left.origin.x + right.x,
    y: left.origin.y + right.y,
    width: left.size.width,
    height: left.size.height
  )
}

/// ...
/// a += b
func += (left: inout CGRect, right: CGPoint) {
  left = left + right
}

/// ...
/// a - b
func - (left: CGRect, right: CGPoint) -> CGRect {
  return CGRect(
    x: left.origin.x - right.x,
    y: left.origin.y - right.y,
    width: left.size.width,
    height: left.size.height
  )
}

/// ...
/// a -= b
func -= (left: inout CGRect, right: CGPoint) {
  left = left - right
}

/// ...
/// a * 2.5
func * (left: CGRect, right: CGFloat) -> CGRect {
  return CGRect(
    x: left.origin.x * right,
    y: left.origin.y * right,
    width: left.size.width * right,
    height: left.size.height * right
  )
}

/// ...
/// a *= 2.5
func *= (left: inout CGRect, right: CGFloat) {
  left = left * right
}

/// ...
/// a / 4.0
func / (left: CGRect, right: CGFloat) -> CGRect {
  return CGRect(
    x: left.origin.x / right,
    y: left.origin.y / right,
    width: left.size.width / right,
    height: left.size.height / right
  )
}

/// ...
/// a /= 4.0
func /= (left: inout CGRect, right: CGFloat) {
  left = left / right
}
