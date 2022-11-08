
enum BookWarnings {
  
  static func run_1() async {
    
    await withTaskCancellationHandler { @MainActor in
      
    } onCancel: {
      print("On cancel, \(#function)")
    }
    
    
  }
  
  @MainActor
  static func run_2() async {
    
    await withTaskCancellationHandler { @MainActor in
      
    } onCancel: {
      print("On cancel, \(#function)")
    }
    
  }
  
  static func run_3() {
    
    Task { @MainActor in
      
      await withTaskCancellationHandler { @MainActor in
        
      } onCancel: {
        print("On cancel, \(#function)")
      }
      
    }
    
  }
  
}

Task {
  await BookWarnings.run_2()
}
.cancel()
