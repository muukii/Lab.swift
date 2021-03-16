struct Condition {
  
  static func factory() -> Self {
    .init()
  }
}

@resultBuilder
enum Mybuilder<Root> {
  
  static func buildBlock(_ components: Condition...) -> Condition {
    fatalError()
  }
  
  static func buildExpression(_ component: Condition) -> Condition {
    component
  }
    
  static func buildExpression<U>(_ expression: KeyPath<Root, U>) -> Condition {
    fatalError()
  }
}

func run(@Mybuilder<String> _ build: () -> Condition) {
  
}

run {
  .factory();
  .factory();
  \.count;
  \.endIndex;
}
