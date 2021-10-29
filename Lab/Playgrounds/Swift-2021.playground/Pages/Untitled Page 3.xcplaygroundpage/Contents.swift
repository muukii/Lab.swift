//

import Foundation

public struct InDevelopmentState {
  
  public let filePath: StaticString
  
  /// Process's enviroment variables
  public let enviroment: [String : String]
  
  init(filePath: StaticString) {
    self.filePath = filePath
    self.enviroment = ProcessInfo().environment
  }
  
  public var inDebugMacro: Bool {
    #if DEBUG
    return true
    #else
    return false
    #endif
  }
  
}

public struct InDevelopmentFilter {
  
  private let predicate: (InDevelopmentState) -> Bool
  
  private init(_ predicate: @escaping (InDevelopmentState) -> Bool) {
    self.predicate = predicate
  }
  
  private init(allSatisfy comparers: [InDevelopmentFilter]) {
    self.init { state in
      for filter in comparers {
        guard filter.isInDevelopment(state: state) else {
          return false
        }
      }
      return true
    }
  }
  
  private init(anySatisfy comparers: [InDevelopmentFilter]) {
    self.init { state in
      for filter in comparers {
        if filter.isInDevelopment(state: state) {
          return true
        }
      }
      return false
    }
  }
  
  public func isInDevelopment(state: InDevelopmentState) -> Bool {
    if state.enviroment["DEV_DISABLE_ALL"] != nil {
      return false
    } else {
      return predicate(state)
    }
  }
  
  public func and(_ filters: InDevelopmentFilter...) -> Self {
    .init(allSatisfy: CollectionOfOne(self) + filters)
  }
  
  public func or(_ filters: InDevelopmentFilter...) -> Self {
    .init(anySatisfy: CollectionOfOne(self) + filters)
  }
  
}

/// Convinience constructors
extension InDevelopmentFilter {
  
  public static func username(_ username: StaticString) -> Self {
    self.init { state in
      state.filePath.description.contains("Users/\(username)/")
    }
  }
     
  public static let inDebugMacro: Self = .init { state in
    state.inDebugMacro == true
  }
    
  public static func processEnviromentVariable(key: String, condition: @escaping (String?) -> Bool) -> Self {
    return .init { (state) -> Bool in
      condition(state.enviroment[key])
    }
  }
  
}

public enum Dev {
  
  public struct FixmeMember {
  }
  
  /**
   An annotation indicates running code is prototyping and should be changed to more brushed-up code.
   */
  @discardableResult
  public static func prototyping<Return>(_ run: () throws -> Return) rethrows -> Return {
    try run()
  }
  
  public static func fixme(_ comment: String = "") {
    
  }
  
  public static func fixme(_ member: FixmeMember, _ comment: String = "") {
    
  }
  
  @discardableResult
  public static func fixme<Return>(_ comment: String = "", run: () throws -> Return) rethrows -> Return {
    try run()
  }
  
  @discardableResult
  public static func fixme<Return>(_ member: FixmeMember, _ comment: String = "", run: () throws -> Return) rethrows -> Return {
    try run()
  }
  
  #if !RELEASE
  
  public static func isInDevelopment(_ filter: InDevelopmentFilter) -> Bool {
    let state = InDevelopmentState(filePath: #file)
    return filter.isInDevelopment(state: state)
  }
  
  #if DEBUG
  
  public static func isInDevelopment(_ filters: [InDevelopmentFilter]) -> Bool {
    
    let state = InDevelopmentState(filePath: #file)
    
    for filter in filters {
      if filter.isInDevelopment(state: state) {
        return true
      }
    }
    return false
  }
  
  #else
  
  public static func isInDevelopment(_ filters: [InDevelopmentFilter]) -> Bool {
    return false
  }
  
  #endif
  
  #else
  
  @inline(__always)
  public static func isInDevelopment(_ filter: InDevelopmentFilter) -> Bool {
    return false
  }
  
  @inline(__always)
  public static func isInDevelopment(_ conditions: [InDevelopmentFilter]) -> Bool {
    return false
  }
  
  #endif
  
}

