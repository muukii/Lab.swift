func run(arg: @autoclosure () -> Bool) {
  arg()
}

func run(arg: () -> Bool) {
  arg()
}


run(arg: false)
run(arg: { false })
