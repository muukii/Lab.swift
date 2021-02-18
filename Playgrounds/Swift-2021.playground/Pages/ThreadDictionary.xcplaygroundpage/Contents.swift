import Foundation

func threadSharedObject<T: AnyObject>(key: String, create: () -> T) -> T {
  if let cachedObj = Thread.current.threadDictionary[key] as? T {
    return cachedObj
  } else {
    let newObject = create()
    Thread.current.threadDictionary[key] = newObject
    return newObject
  }
}

extension Thread {
  
  public func retrieveSharedObject<T: AnyObject>(key: String, create: () -> T) -> T {
    if let cachedObj = Thread.current.threadDictionary[key] as? T {
      return cachedObj
    } else {
      let newObject = create()
      Thread.current.threadDictionary[key] = newObject
      return newObject
    }
  }
  
}
