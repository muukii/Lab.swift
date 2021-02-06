import Combine

let input = PassthroughSubject<String, Never>()

let buffer = input.buffer(size: 3, prefetch: .byRequest, whenFull: .dropOldest)
  .makeConnectable()

buffer.connect()

let output = buffer
  .makeConnectable()

input.send("1")
input.send("2")
input.send("3")
input.send("4")
input.send("5")

output.sink { (value) in
  print(value)
}

output.sink { (value) in
  print(value)
}

output.connect()
