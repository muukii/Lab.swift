
class Store<T> {
  
  init(initialState: T) {
    
  }
    
  @available(*, deprecated, message: "Value types only")
  init(initialState: T) where T : AnyObject {
//    #error("No")
  }
}

class WrongState {
  
}

struct State {
  
}

Store<State>(initialState: .init())
Store<WrongState>(initialState: .init())

let ref: Any = WrongState()
let value: Any = State()

type(of: ref) is AnyObject.Type
type(of: value) is AnyObject.Type
