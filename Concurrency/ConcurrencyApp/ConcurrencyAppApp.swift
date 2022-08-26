//
//  ConcurrencyAppApp.swift
//  ConcurrencyApp
//
//  Created by Muukii on 2022/06/18.
//

import SwiftUI

let register: Void = {
  _ = RunLoopActivityObserver.addObserver(acitivity: .entry) {
//    print("RunLoop - Entry", CACurrentMediaTime())
  }
}()

@main
struct ConcurrencyAppApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .onAppear {
         _ = register
        }
    }
  }
}

public enum RunLoopActivityObserver {
  
  public struct Subscription {
    let observer: CFRunLoopObserver?
  }
  
  public static func addObserver(acitivity: CFRunLoopActivity, callback: @escaping () -> Void) -> Subscription {
    
    let o = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault, acitivity.rawValue, true, Int.max, { observer, activity in
      callback()
    });
    
    CFRunLoopAddObserver(CFRunLoopGetMain(), o, CFRunLoopMode.defaultMode);
    
    return .init(observer: o)
  }
  
  public static func remove(_ subscription: Subscription) {
    subscription.observer.map {
      CFRunLoopRemoveObserver(CFRunLoopGetMain(), $0, CFRunLoopMode.defaultMode);
    }
  }
  
}
