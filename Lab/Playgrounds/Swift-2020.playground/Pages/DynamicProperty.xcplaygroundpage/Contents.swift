
import ObjectiveC

var associated_key: Void?

final class DictionaryRef {
  var dictionary: [String : Any] = [:]
}

@propertyWrapper
public struct Property<WrappedValue> {
  
  @available(*, unavailable)
  public var wrappedValue: WrappedValue {
    get { fatalError() }
    set { fatalError() }
  }
  
  public let key: String
  public let defaultValue: WrappedValue
  
  public init(wrappedValue: WrappedValue, key: String) {
    self.key = key
    self.defaultValue = wrappedValue
  }
  
  public static subscript<Instance: AnyObject>(
    _enclosingInstance instance: Instance,
    wrapped wrappedKeyPath: KeyPath<Instance, WrappedValue>,
    storage storageKeyPath: KeyPath<Instance, Self>
  ) -> WrappedValue {
    get {
      let storage = instance[keyPath: storageKeyPath]
      
      let ref = Self.prepareStorage(for: instance)
      
      return (ref.dictionary[storage.key] as? WrappedValue) ?? storage.defaultValue
    }
    set {
      let storage = instance[keyPath: storageKeyPath]
      let ref = Self.prepareStorage(for: instance)
      ref.dictionary[storage.key] = newValue
    }
  }
  
  private static func prepareStorage(for instance: AnyObject) -> DictionaryRef {
    
    objc_sync_enter(instance)
    defer {
      objc_sync_exit(instance)
    }
    
    if let ref = objc_getAssociatedObject(instance, &associated_key) as? DictionaryRef {
      return ref
    }
    
    let ref = DictionaryRef()
    
    objc_setAssociatedObject(instance, &associated_key, ref, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    
    return ref
  }
  
}

