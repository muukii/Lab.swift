
class Ref {}

weak var indirectRef: Ref?

let closure = { [indirectRef] in
  print(indirectRef as Any)
}

let closure_2 = {
  print(indirectRef as Any)
}

let strongRef = Ref()
indirectRef = strongRef

closure()
closure_2()
