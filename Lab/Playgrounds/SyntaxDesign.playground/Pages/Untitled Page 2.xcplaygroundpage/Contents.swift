
protocol AnimalType {
    
}

struct Dog: AnimalType {
  
}

struct Cat: AnimalType {
  
}

extension AnimalType where Self == Dog {
  
  static var john: Dog {
    Dog()
  }
  
}

extension AnimalType where Self == Cat {
  
  static var johny: Cat {
    Cat()
  }
  
}

func _existential_pet(_ pet: AnimalType) {
  
}

func _specialized_pet<Pet: AnimalType>(_ pet: Pet) {
  
}

_existential_pet(.john)
_existential_pet(.johny)

_specialized_pet(.john)
_specialized_pet(.johny)


