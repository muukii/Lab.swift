protocol BoxType {
  
}

struct Box<T>: BoxType {
  
}

@resultBuilder
enum PartialBlockBuilder {
  
  typealias Component = Box
  
  static func buildBlock<T>(_ component: Box<T>) -> Box<T> {
    component
  }
  
  /// Builds a partial result component from the first component.
  static func buildPartialBlock<T>(first: Box<T>) -> Box<T> {
    fatalError()
  }
  
  static func buildPartialBlock<N, A>(accumulated: Box<(A)>, next: Box<N>) -> Box<(A, N)>{
    fatalError()
  }
  
  static func buildPartialBlock<N, A, B>(accumulated: Box<(A, B)>, next: Box<N>) -> Box<(A, B, N)>{
    fatalError()
  }
}


func run<Box: BoxType>(@PartialBlockBuilder _ closure: () -> Box) -> Box {
  fatalError()
}

let type = run {
  Box<String>()
  Box<String>()
  Box<String>()
  Box<String>()
  Box<String>()
  Box<String>()
//  Box<String>()
}
