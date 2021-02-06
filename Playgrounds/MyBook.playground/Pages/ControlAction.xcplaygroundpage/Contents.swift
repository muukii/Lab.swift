//: [Previous](@previous)

import Foundation

/**
 
 var onTap: () -> Void
 
 @ControlAction var onTap: Void
 @ControlAction var onSendButton: Text
 
 */

@propertyWrapper
public final class ControlAction<Argument> {
  
  public typealias Handler = (Argument) -> Void
  
  public static subscript<Owner>(
  _enclosingInstance instance: Owner,
  wrapped wrappedKeyPath: ReferenceWritableKeyPath<Self, Handler>,
  storage storageKeyPath: ReferenceWritableKeyPath<Owner, Self>
  ) -> Owner {
    get {
    fatalError()
    }
    set {
      fatalError()
    }
  }
    
  @available(*, unavailable)
  public var wrappedValue: Argument {
    get { fatalError() }
    set { fatalError() }
  }
    
  public init() {

  }
        
}

import UIKit

class Control: UIView {
  
  @ControlAction var onTap: Void
  
}

let control = Control()

control.onTap


//: [Next](@next)
