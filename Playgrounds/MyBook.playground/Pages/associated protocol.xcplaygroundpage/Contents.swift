//: [Previous](@previous)

protocol StateType {
  
}

protocol StoreType {
  associatedtype State: StateType
}

class ConcreteStore: StoreType {
  struct State: StateType {}
}

protocol BaseProtocol {
  
  associatedtype Store: StoreType
  associatedtype Scope
  
  var store: Store { get }
  var scope: KeyPath<Store.State, Scope> { get }
}

protocol ExtendedProtocol: BaseProtocol {
  associatedtype Store
  var store: Store { get }
}

extension ExtendedProtocol {
  typealias Scope = Store.State
  var scope: KeyPath<Store.State, Scope> { \Scope.self }
}

class Object: ExtendedProtocol {
  var store: ConcreteStore { fatalError() }
        
}

//: [Next](@next)
