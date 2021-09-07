import RxSwift

func makeTask(index: Int) -> Single<Int> {

  return .create { observer in

    print("Start", index, Thread.current)

//    sleep(1)

    DispatchQueue.global().async {

      DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
        print("Finish", index, Thread.current)

        observer(.success(index))
      }
    }

    return Disposables.create()
  }

}

let scheduler = ConcurrentDispatchQueueScheduler.init(queue: .init(label: "my_queue"))
Single.zip(
  (0..<10).map {
    makeTask(index: $0)
  }
)
//.subscribe(on: scheduler)
//.observe(on: scheduler)
.debug()
.do(onSuccess: { _ in
  print(Thread.current)
})
.subscribe()
