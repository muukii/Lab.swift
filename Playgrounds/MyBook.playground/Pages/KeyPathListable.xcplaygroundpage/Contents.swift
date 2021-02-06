protocol KeyPathListable {
//  associatedtype AnyOldObject
  // require empty init as the implementation use the mirroring API, which require
  // to be used on an instance. So we need to be able to create a new instance of the
  // type. See @@@^^^@@@
  init()
  
  var keyPathReadableFormat: [String: Any] { get }
  var allKeyPaths: [String : AnyKeyPath] { get }
}

extension KeyPathListable {
  
  var keyPathReadableFormat: [String: Any] {
    var description: [String: Any] = [:]
    let mirror = Mirror(reflecting: self)
    for case let (label?, value) in mirror.children {
      description[label] = value
    }
    return description
  }
  
  var allKeyPaths: [String : AnyKeyPath] {
    var membersTokeyPaths: [String:AnyKeyPath] = [:]
    let instance = Self() // @@@^^^@@@
    for (key, _) in instance.keyPathReadableFormat {
      membersTokeyPaths[key] = \Self.keyPathReadableFormat[key]
    }
    return membersTokeyPaths
  }
  
}

struct Foo: KeyPathListable {
  let name = ""
  let age = 0
}

dump(\Foo.name)

print(Foo().allKeyPaths["name"]! == \Foo.name as AnyKeyPath)

print((\Foo.name as AnyKeyPath) == (\Foo.name as AnyKeyPath))
