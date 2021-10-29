
func run(myFlag: Bool) {
  let mirror = Mirror(reflecting: myFlag)
  mirror.children

}

run(myFlag: false)
