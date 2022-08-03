
import AppKit
import Foundation
import _Concurrency
import XCTest

@MainActor
class Controller {
  
  func run() {
    
  }
}

func topLevelPerform(_ closure: @escaping @Sendable () -> Void) {
  DispatchQueue.global().async {
    closure()
  }
}

final class CompilerTest: XCTestCase {

  @MainActor
  func testCompile_isolated() {
        
    let controller = Controller()
    
    topLevelPerform {
      
//      let controller = Controller()      
      
    }
        
  }
//  
//  func testCompile_nonisolated() {
//    
//    let controller = Controller()
//    
//  }
  
}
 
