import RxSwift

let subject = BehaviorSubject<Int>(value: 1)

let s = subject
  .skip(1)
  .asInfallible(onErrorRecover: { _ in fatalError() })
  .startWith(0)

s.do(onNext: { v in
  print(v)
})
.subscribe()

subject.onNext(2)
