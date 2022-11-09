
func owned_run(_ value: __owned String) {
  print(value)
}

func shared_run(_ value: __shared String) {
  var v = value
  v = ""
  print(v)
}

var value = "Hello"

owned_run(value)

shared_run(value)

print(value)
