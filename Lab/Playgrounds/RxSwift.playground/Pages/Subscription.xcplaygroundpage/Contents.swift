import RxSwift
import Foundation

let o = Observable<Int>.create { observer in
  
  DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    observer.onNext(10)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      observer.onCompleted()
    }
  }
  
  return Disposables.create {
    print("dispose")
  }
}

_ = o.debug().subscribe()
