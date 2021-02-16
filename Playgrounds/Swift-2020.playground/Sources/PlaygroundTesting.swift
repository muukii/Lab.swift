import Foundation

// Playground Testing

fileprivate let success = "✅"
fileprivate let failure = "❌"

public enum PT {

  public static func assertEqual<T: Equatable>(_ lhs: T, _ rhs: T) -> String {
    lhs == rhs ? success : failure
  }

  public static func assert(_ evaluate: () -> Bool) -> String {
    evaluate() ? success : failure
  }

  public static func assert(_ evaluate: @autoclosure () -> Bool) -> String {
    evaluate() ? success : failure
  }
  
}
