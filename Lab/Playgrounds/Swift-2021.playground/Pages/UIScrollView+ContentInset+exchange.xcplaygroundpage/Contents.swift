import ObjectiveC
import UIKit

let swizzle: Void = {

  print("swizzle")

  method_exchangeImplementations(
    class_getInstanceMethod(UIScrollView.self, #selector(setter:UIScrollView.contentInset))!,
    class_getInstanceMethod(UIScrollView.self, #selector(UIScrollView._mmm_setContentInset))!
  )

  method_exchangeImplementations(
    class_getInstanceMethod(UIScrollView.self, #selector(getter:UIScrollView.contentInset))!,
    class_getInstanceMethod(UIScrollView.self, #selector(UIScrollView._mmm_contentInset))!
  )

}()

private var _valueContainerAssociated: Void?

extension UIScrollView {

  final class Handlers {

    var onSetContentInset: ((UIScrollView, UIEdgeInsets) -> UIEdgeInsets)?
    var onContentInset: ((UIScrollView) -> UIEdgeInsets)?
  }

  var handlers: Handlers {

    assert(Thread.isMainThread)

    if let associated = objc_getAssociatedObject(self, &_valueContainerAssociated) as? Handlers {
      return associated
    } else {
      let associated = Handlers()

      _ = swizzle

      objc_setAssociatedObject(
        self,
        &_valueContainerAssociated,
        associated,
        .OBJC_ASSOCIATION_RETAIN
      )
      return associated
    }
  }

  @objc dynamic func _mmm_setContentInset(_ contentInset: UIEdgeInsets) {
    print(contentInset)

    guard let handler = handlers.onSetContentInset else {
      self._mmm_setContentInset(contentInset)
      return
    }

    let manipulated = handler(self, contentInset)
    self._mmm_setContentInset(manipulated)
  }

  @objc dynamic func _mmm_contentInset() -> UIEdgeInsets {

    guard let handler = handlers.onContentInset else {
      return self._mmm_contentInset()
    }

    return handler(self)
  }

}

do {
  let scrollView = UIScrollView()

  scrollView.contentInset.top = 10

  PT.assert(scrollView.contentInset.top == 10)
}

do {
  let scrollView = UIScrollView()

  scrollView.handlers.onSetContentInset = { _, insets in
    var insets = insets
    insets.top += 10
    return insets
  }

  scrollView.contentInset.top = 10

  PT.assert(scrollView.contentInset.top == 20)

}
