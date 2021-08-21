//: [Previous](@previous)

import RxSwift

let maybe = Maybe<Int>.create { observer in
  observer(.success(3))
  return Disposables.create()
}

maybe.asObservable().subscribe { event in
  switch event {
  case .next:
    print("success")
  case .error(_):
    print("error")
  case .completed:
    print("completed")
  }
}

//: [Next](@next)
