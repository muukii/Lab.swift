//: [Previous](@previous)

public struct EnclosingRawValue<RawValue: Hashable, Trait>: Hashable {
  
  public let rawValue: RawValue

  public init(_ rawValue: RawValue) {
    self.rawValue = rawValue
  }
  
}
