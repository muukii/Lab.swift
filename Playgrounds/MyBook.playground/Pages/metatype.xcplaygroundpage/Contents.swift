
struct A {
  
  struct B {
    
    struct C {
      
    }
  }
  
  struct C {
    
  }
}

type(of: A.self)
let hoge = type(of: A.C.self)
type(of: A.B.C.self) == type(of: A.C.self)
