import os

struct MyString : ExpressibleByStringInterpolation {

  var paths: [String] = []

  public init(stringLiteral value: String) {
    self.paths = [value]
  }

  public typealias StringLiteralType = String

  public typealias ExtendedGraphemeClusterLiteralType = String

  public typealias UnicodeScalarLiteralType = String

}

extension MyString.StringInterpolation {
  mutating func appendInterpolation(reversed value: String) {
    self.appendInterpolation(String(value.reversed()))
  }
}

//extension DefaultStringInterpolation {
//
//  mutating func appendInterpolation(_ value: String) {
//    self.appendInterpolation(String(value.reversed()))
//  }
//}

struct CustomType {}

let string: MyString = "\("abc"), \("abc"), \("abc")"

print(string)
