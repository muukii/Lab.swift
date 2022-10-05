import Foundation
import SwiftUI

struct BookDispatchToActor: View {
  var body: some View {
    Button("Action") {
    
//      nonisolated_entrypoint()
    }
  }
}

private func nonisolated_entrypoint() {

  // non-isolated-context here
  
  thunk {
    Task { @MainActor in
      // detaches into main-actor-isolated-context
      
      // can perform this method without awaiting
      runUIOperation()
    }
  }
}

private func nonisolated_thunkMain_entrypoint() {
  
  // non-isolated-context here
  
  thunk {
    thunkToMainActor {
      runUIOperation()
    }
  }

  thunkToMainActor {
    runUIOperation()
  }
}

@MainActor
private func main_isolated_task_entrypoint() {
  
  // main-actor-isolated-context here
  
  thunk {
    Task { @MainActor in
      runUIOperation()
    }
  }
}

@MainActor
private func main_isolated_entrypoint() {
  
  // main-actor-isolated-context here
  
  thunk {
//    runUIOperation()
  }
}

private func thunk(_ closure: @escaping @Sendable () -> Void) {
  closure()
}

@inline(__always)
func thunkToMainActor(_ run: @MainActor () throws -> Void) rethrows {  
  try _thunkToMainActor { @MainActor(unsafe) in
    try run()
  }
}

@inline(__always)
func _thunkToMainActor(_ run: () throws -> Void) rethrows {
  try run()
}

@MainActor
private func runUIOperation() {
  print("run")
}
