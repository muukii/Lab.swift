import os

#if false
var logger: Logger!
logger.log("Ordered smoothie \("", privacy: .public)")
#endif

struct LogMessageInterpolation: StringInterpolationProtocol {

  var value: String = ""

  typealias StringLiteralType = String

  @inlinable public init(
    literalCapacity: Int,
    interpolationCount: Int
  ) {
    self.value.reserveCapacity(literalCapacity)
  }

  mutating func appendLiteral(_ literal: String) {
    self.value.append(literal)
  }

  mutating func appendInterpolation<T>(_ value: T) where T: CustomStringConvertible {
    self.value.append(String(describing: value))
  }

  mutating func appendInterpolation(count: Int) {
    self.value.append("count: \(count)")
  }
}

struct LogMessage: ExpressibleByStringLiteral, ExpressibleByStringInterpolation {

  public typealias StringInterpolation = LogMessageInterpolation

  public var body: String

  public init(
    stringLiteral value: String
  ) {
    self.body = value
  }

  init(
    stringInterpolation: LogMessageInterpolation
  ) {
    self.body = stringInterpolation.value
  }

}

let logMessage: LogMessage = "Hello \(128), \(count: 3)"

print(logMessage.body)
