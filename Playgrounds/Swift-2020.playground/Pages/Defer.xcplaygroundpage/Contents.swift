
func run() -> () -> Void {
  defer {
    print("run defer")
  }
  return {
    print("run body")
  }
}

run()()
