//: [Previous](@previous)

enum MessageDisplayKit {

  class CellModel {


  }

  class WrapperCell {

    let bodyNode: AppUIKit.CellNode
    let viewModel: MessageDisplayKit.CellModel

  }
}


enum AppUIKit {

  class CellNode {

  }
}


// In MessageDisplayKit
extension AppUIKit.CellNode {

  func bind(cellModel: MessageDisplayKit.CellModel) {

  }

}


//: [Next](@next)
