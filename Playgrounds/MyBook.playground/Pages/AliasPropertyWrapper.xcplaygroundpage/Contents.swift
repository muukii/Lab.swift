@propertyWrapper
public struct Alias<Instance, T> {

  @available(*, unavailable)
  public var wrappedValue: T {
    get { fatalError() }
    set { fatalError() }
  }
  //
  //  @available(*, unavailable)
  //  public var projectedValue: Alias<T> {
  //    get { fatalError() }
  //    set { fatalError() }
  //  }

  public static subscript(
    _enclosingInstance instance: Instance,
    wrapped wrappedKeyPath: KeyPath<Instance, T>,
    storage storageKeyPath: KeyPath<Instance, Self>
  ) -> T {
    get {

      fatalError()
    }
    set {
      fatalError()
    }
  }

  //  public static subscript(
  //    _enclosingInstance instance: Store,
  //    projected wrappedKeyPath: KeyPath<Store, Getter<T>>,
  //    storage storageKeyPath: KeyPath<Store, Self>
  //  ) -> Getter<T> {
  //  }
  public init() {}

}

public class Wrapper {

  @Alias() var action: () -> Void

  var body: Body = .init()
}

class Body {

  var action: () -> Void = {}

  init() {}
}

let wrapper = Wrapper()

_ = wrapper.action
