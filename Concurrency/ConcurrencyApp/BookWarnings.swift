
enum BookWarnings {
  
  static func run_1() async {
    
    await withTaskCancellationHandler {
      
    } onCancel: {
      
    }

  }
  
  @MainActor
  static func run_2() async {
    
    await withTaskCancellationHandler { @MainActor in
      
    } onCancel: {
      
    }
        
    await my_withTaskCancellationHandler { @MainActor in
      
    } onCancel: {
      
    }
  }
  
  static func run_3() {
    
    Task { @MainActor in
      
      await withTaskCancellationHandler {
        
      } onCancel: {
        
      }
    }
    
  }
  
}


func my_withTaskCancellationHandler<T>(operation: @MainActor () async throws -> T, onCancel handler: @MainActor @Sendable () -> Void) async rethrows -> T {
  fatalError()
}
