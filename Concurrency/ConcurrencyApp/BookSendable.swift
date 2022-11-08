enum BookSendable {

  class NonSendable {

    var value = 0

    func run() {

    }
  }

  @MainActor
  class ActorAssociated {

  }

  func run_0() {

    let instance = NonSendable()

    Task {

      instance
    }

  }

  @MainActor
  func run_1() {

    let instance = NonSendable()

    Task { @MainActor in

      instance
    }

  }

  @MainActor
  func run_2() {

    let instance = ActorAssociated()

    Task { @MainActor in

      instance
    }

  }

  class Controller {

    @MainActor let constant = 0
    @MainActor var mutable = 0
    var nonActorIsolatedValue = 0

    nonisolated func run_0() {

      Task {
        
        // ok without await since it's constant, won't change
        self.constant
        
        // needs await since it's mutable, will change
        await self.mutable
        
        // no needs await, it's just member.
        self.nonActorIsolatedValue
      }

    }
  }

  actor MyActor {

    var value: Int = 0

    func perform(_ thunk: @Sendable (isolated MyActor) -> Void) {
      thunk(self)
    }

  }

  func _actor() {

    let actor = MyActor()
    let box = Box()
    let sub = Sub()

    Task {
      _ = box
      await actor.perform { actor in
        actor.value = 1
      }
      
      _ = sub
    }

  }

}

@MainActor
private func ui() {

}

struct Box {
  
}

class Root: Sendable {
  
}

class Sub: Root {
  
}
