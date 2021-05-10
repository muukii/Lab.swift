
var a: Int? = 3
var b: Int? = 1

switch (a, b) {
case (.some(let value), _), (_, .some(let value)):
  print(value)
default:
  break
}
