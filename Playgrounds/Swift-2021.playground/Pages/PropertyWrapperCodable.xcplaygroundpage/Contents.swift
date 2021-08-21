//: [Previous](@previous)

import Foundation

public protocol CustomDecoder {

  associatedtype Value

  static func decode(from decoder: Decoder) throws -> Value
}

public protocol CustomEncoder {

  associatedtype Value

  static func encode(value: Value, in encoder: Encoder) throws
}

@propertyWrapper
public struct CustomCoding<Value: Codable, Encoding: CustomEncoder, Decoding: CustomDecoder>:
  Codable
where Encoding.Value == Value, Decoding.Value == Value {

  public var wrappedValue: Value

  public init(
    wrappedValue: Value
  ) {
    self.wrappedValue = wrappedValue
  }

  public init(
    from decoder: Decoder
  ) throws {

    let value = try Decoding.decode(from: decoder)
    self.wrappedValue = value
  }

  public func encode(to encoder: Encoder) throws {
    try Encoding.encode(value: wrappedValue, in: encoder)
  }

}

@propertyWrapper
public struct CustomDecoding<Value, Decoding: CustomDecoder>: Decodable
where Decoding.Value == Value {

  public var wrappedValue: Value

  public init(
    wrappedValue: Value
  ) {
    self.wrappedValue = wrappedValue
  }

  public init(
    from decoder: Decoder
  ) throws {

    let value = try Decoding.decode(from: decoder)
    self.wrappedValue = value
  }

}

// MARK: Example

enum StringToDecimalDecoder: CustomDecoder {
  typealias Value = Decimal

  static func decode(from decoder: Decoder) throws -> Decimal {
    let value = try decoder.singleValueContainer().decode(String.self)
    return try Decimal.init(value, format: .number)
  }
}

struct Container: Decodable {

  var name: String
  @CustomDecoding<Decimal, StringToDecimalDecoder> var number: Decimal

}

let json = """
{
  "name": "muukii",
  "number": "0.07"
}
""".data(using: .utf8)!

let decoder = JSONDecoder()

let container = try decoder.decode(Container.self, from: json)

print(container)

//: [Next](@next)
