protocol A {

  subscript(_ v: Int) -> String { get }

}

extension A  {
  subscript(_ v: Int) -> String { "A" }
}

protocol _A: A {

  override subscript(_ v: Int) -> String { get set }

}

extension _A  {
  subscript(_ v: Int) -> String {
    get {
      "_A"
    }
    set {
      fatalError()
    }
  }
}

struct Concrete: A, _A {
  
}

let c = Concrete()
c[1]

let a = c as A
a[1]
