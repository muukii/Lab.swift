import RxSwift
let subject = BehaviorSubject<Int>(value: 1)

DispatchQueue.concurrentPerform(iterations: 100) { (i) in
  subject.onNext(i)
}
