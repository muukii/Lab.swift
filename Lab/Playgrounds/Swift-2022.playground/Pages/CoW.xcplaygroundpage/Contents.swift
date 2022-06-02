
print("hello")

class Storage<Value> {
  
  var value: Value
  
  init(_ value: Value) {
    self.value = value
  }
  
  
}

struct CoWBox<Value> {
  
  private var version: UInt64 = 0
  private var storage: Storage<Value>
  
  var value: Value {
    get {
      storage.value // with version
    }
    set {
      
      if isKnownUniquelyReferenced(&storage) {
        storage.value = newValue
      } else {
        // needs copy
        version &+= 1
        
        let newStorage = Storage.init(newValue)
        storage = newStorage
      }
    }
  }

  init(_ value: Value) {
    self.storage = .init(value)
  }
}

let a = CoWBox(1)
var b = a

PT.assertEqual(a.value, 1)
PT.assertEqual(b.value, 1)

b.value = 2

PT.assertEqual(a.value, 1)
PT.assertEqual(b.value, 2)
