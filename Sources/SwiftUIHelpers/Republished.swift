import Combine

@propertyWrapper
public struct Republished<Object: ObservableObject>
  where Object.ObjectWillChangePublisher == ObservableObjectPublisher
{
  private let box: Box

  public init(wrappedValue object: Object) {
    box = Box(Published(initialValue: object))
  }

  @MainActor
  public var wrappedValue: Object {
    box.published
  }

  public var projectedValue: Published<Object>.Publisher {
    box.$published
  }

  @MainActor public static subscript<Instance>(
    _enclosingInstance instance: Instance,
    wrapped _: KeyPath<Instance, Object>,
    storage storageKeyPath: KeyPath<Instance, Self>
  ) -> Object {
    let wrapper = instance[keyPath: storageKeyPath]

    if wrapper.box.cancellable == nil {
      wrapper.box.cancellable = wrapper.box.published
        .objectWillChange
        .sink(receiveValue: { [instance] in
          func publisher<T>(_ value: T) -> ObservableObjectPublisher? {
            (Proxy<T>() as? ObservableObjectProxy)?.extractObjectWillChange(value)
          }

          let objectWillChangePublisher = _openExistential(instance as Any, do: publisher)

          objectWillChangePublisher?.send()
        })
    }

    return wrapper.wrappedValue
  }
}

extension Republished {
  private final class Box {
    @Published var published: Object
    var cancellable: AnyCancellable?

    init(_ published: Published<Object>) {
      _published = published
    }
  }
}

private protocol ObservableObjectProxy {
  func extractObjectWillChange<T>(_ instance: T) -> ObservableObjectPublisher
}

private struct Proxy<Base> {
  func extract<A, B, C>(_ instance: A, _ extract: (Base) -> B) -> C {
    extract(instance as! Base) as! C
  }
}

extension Proxy: ObservableObjectProxy where Base: ObservableObject,
  Base.ObjectWillChangePublisher == ObservableObjectPublisher
{
  func extractObjectWillChange<T>(_ instance: T) -> ObservableObjectPublisher {
    extract(instance) { $0.objectWillChange }
  }
}
