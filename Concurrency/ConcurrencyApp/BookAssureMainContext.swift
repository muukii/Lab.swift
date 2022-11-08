
import SwiftUI

struct BookAssureMainContext: View {
  var body: some View {
    Button("Run") {
      _run()
    }
  }
}

fileprivate func _run() {
  ensureInMainContext {
    _runUI()
  }
}

@MainActor
fileprivate func _runUI() {
  
}

struct BookAssureMainContext_Previews: PreviewProvider {
  static var previews: some View {
    BookAssureMainContext()
  }
}

public func ensureInMainContext<Return>(
  _ thunk: @escaping @MainActor () -> Return
) -> Return {
  
  func trampoline(_ thunk: () -> Void) {
    thunk()
  }
  
  assert(Thread.isMainThread)
  
  var result: Return?
  trampoline { @MainActor in
    result = thunk()
  }
    
  return result!
}
