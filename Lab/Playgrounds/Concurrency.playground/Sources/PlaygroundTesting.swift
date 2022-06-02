import Foundation

// Playground Testing


fileprivate let success = "✅"
fileprivate let failure = "❌"

public enum PT {

  public enum Result: CustomStringConvertible, CustomDebugStringConvertible {
    case success
    case failure
    
    public var debugDescription: String {
      switch self {
      case .success:
        return "✅"
      case .failure:
        return "❌"
      }
    }
    
    public var description: String {
      debugDescription
    }
  }
    
  public static func _assert(_ evaluate: () -> Bool) -> Result {
    evaluate() ? .success : .failure
  }

  
  public static func assertEqual<T: Equatable>(_ lhs: T, _ rhs: T) -> Result {
    lhs == rhs ? .success : .failure
  }

  public static func assert(_ evaluate: @autoclosure () -> Bool) -> Result {
    evaluate() ? .success : .failure
  }
  
  public static func assertNil<T>(_ object: Optional<T>) -> Result {
    _assert { object == nil }
  }
 
  public static func assertNotNil<T>(_ object: Optional<T>) -> Result {
    _assert { object != nil }
  }
  
  public static func fail() -> Result {
    .failure
  }
  
}
