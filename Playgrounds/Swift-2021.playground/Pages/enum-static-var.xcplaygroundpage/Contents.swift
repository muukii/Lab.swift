
protocol HasBook {
  static var book: Kind { get }
}

enum Kind: HasBook {
  case book
  case album(Bool)
}

let a = Kind.book
let b = Kind.album

