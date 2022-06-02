import _Concurrency

func run() async {
  
  print("0")
  defer {
    print("2")
  }
  
  try! await Task.sleep(nanoseconds: 1_000_000_000)
  
  print("1")
}

Task {
  await run()
}
