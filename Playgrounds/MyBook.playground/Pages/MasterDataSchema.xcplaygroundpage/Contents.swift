//: [Previous](@previous)

protocol SelectionItemType {
  
}

struct IsolatedFilter: SelectionItemType {
  
  // TODO: Naming
  struct Kind {
    
  }
  
  let id: String
  let name: String
  let kind: Kind
}

struct BoundItem: SelectionItemType {
  // TODO: Naming
  struct Kind {
    
  }
  
  let id: String
  let comparableValue: Int
  let name: String
  let kind: Kind
}

struct Item<Selection: SelectionItemType> {
  
  let selections: [Selection]
  
}

let a: Range<Int> = 0..<10
let b: ClosedRange<Int> = 0...10
let c: PartialRangeUpTo<Int> = ..<10
let d: PartialRangeThrough<Int> = ...10
let e: PartialRangeFrom<Int> = 0...

[1].filter { _ in true }

//: [Next](@next)
