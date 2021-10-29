import UIKit

extension CGRect {
  public enum AnchorPoint {
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
  }

  public func resized(
    deltaWidth: CGFloat,
    deltaHeight: CGFloat,
    aspectRatio: CGSize?,
    anchorPoint: AnchorPoint,
    constraintRect: CGRect,
    minimumSize: CGSize
  ) -> CGRect {
    var new = self
    new.resizing(
      deltaWidth: deltaWidth,
      deltaHeight: deltaHeight,
      aspectRatio: aspectRatio,
      anchorPoint: anchorPoint,
      constraintRect: constraintRect,
      minimumSize: minimumSize
    )
    return new
  }

  public mutating func resizing(
    deltaWidth: CGFloat,
    deltaHeight: CGFloat,
    aspectRatio: CGSize?,
    anchorPoint: AnchorPoint,
    constraintRect: CGRect,
    minimumSize: CGSize
  ) {
    var proposedRect = self

    switch anchorPoint {
    case .topLeft:

      proposedRect.size.width += deltaWidth
      proposedRect.size.height += deltaHeight

      if proposedRect.width < minimumSize.width {
        proposedRect.size.width = minimumSize.width
      }

      if proposedRect.height < minimumSize.height {
        proposedRect.size.height = minimumSize.height
      }

    case .topRight:

      proposedRect.origin.x -= deltaWidth
      proposedRect.size.width += deltaWidth
      proposedRect.size.height += deltaHeight

      if proposedRect.width < minimumSize.width {
        proposedRect.origin.x += proposedRect.width - minimumSize.width
        proposedRect.size.width = minimumSize.width
      }

      if proposedRect.height < minimumSize.height {
        proposedRect.origin.y += proposedRect.height - minimumSize.height
        proposedRect.size.height = minimumSize.height
      }

    case .bottomLeft:

      proposedRect.origin.y -= deltaHeight
      proposedRect.size.width += deltaWidth
      proposedRect.size.height += deltaHeight

      if proposedRect.width < minimumSize.width {
        proposedRect.size.width = minimumSize.width
      }

      if proposedRect.height < minimumSize.height {
        proposedRect.origin.y += proposedRect.height - minimumSize.height
        proposedRect.size.height = minimumSize.height
      }

    case .bottomRight:

      proposedRect.origin.x -= deltaWidth
      proposedRect.origin.y -= deltaHeight
      proposedRect.size.width += deltaWidth
      proposedRect.size.height += deltaHeight

      if proposedRect.width < minimumSize.width {
        proposedRect.origin.x += proposedRect.width - minimumSize.width
        proposedRect.size.width = minimumSize.width
      }

      if proposedRect.height < minimumSize.height {
        proposedRect.origin.y += proposedRect.height - minimumSize.height
        proposedRect.size.height = minimumSize.height
      }
    }

    self = proposedRect
  }
}

do {
  var rect = CGRect(x: 10, y: 10, width: 50, height: 50)

  rect.resizing(
    deltaWidth: -30,
    deltaHeight: 20,
    aspectRatio: nil,
    anchorPoint: .topRight,
    constraintRect: .zero,
    minimumSize: .init(width: 30, height: 30)
  )

  PT.assertEqual(rect, CGRect(x: -10, y: 10, width: 30, height: 30))
}

do {
  var rect = CGRect(x: 10, y: 10, width: 10, height: 10)
  rect.resizing(
    deltaWidth: 20,
    deltaHeight: 20,
    aspectRatio: nil,
    anchorPoint: .topRight,
    constraintRect: .zero,
    minimumSize: .zero
  )
  PT.assertEqual(rect, CGRect(x: -10, y: 10, width: 30, height: 30))
}

do {
  var rect = CGRect(x: 10, y: 10, width: 10, height: 10)
  rect.resizing(
    deltaWidth: 20,
    deltaHeight: 20,
    aspectRatio: nil,
    anchorPoint: .bottomLeft,
    constraintRect: .zero,
    minimumSize: .zero
  )
  PT.assertEqual(rect, CGRect(x: 10, y: -10, width: 30, height: 30))
}

do {
  var rect = CGRect(x: 10, y: 10, width: 10, height: 10)
  rect.resizing(
    deltaWidth: 20,
    deltaHeight: 20,
    aspectRatio: nil,
    anchorPoint: .bottomRight,
    constraintRect: .zero,
    minimumSize: .zero
  )
  PT.assertEqual(rect, CGRect(x: -10, y: -10, width: 30, height: 30))
}

do {
  var rect = CGRect(x: 10, y: 10, width: 10, height: 10)
  rect.resizing(
    deltaWidth: 20,
    deltaHeight: 20,
    aspectRatio: nil,
    anchorPoint: .topLeft,
    constraintRect: .zero,
    minimumSize: .zero
  )
  PT.assertEqual(rect, CGRect(x: 10, y: 10, width: 30, height: 30))
}

do {
  let path = UIBezierPath()

  var rect = CGRect(x: 10, y: 10, width: 10, height: 10)

  path.append(.init(rect: rect))

  rect.resizing(
    deltaWidth: 20,
    deltaHeight: 20,
    aspectRatio: nil,
    anchorPoint: .topRight,
    constraintRect: .zero,
    minimumSize: .zero
  )

  path.append(.init(rect: rect))

  path
}

do {
  let path = UIBezierPath()

  var rect = CGRect(x: 10, y: 10, width: 10, height: 10)

  path.append(.init(rect: rect))

  rect.resizing(
    deltaWidth: 20,
    deltaHeight: 20,
    aspectRatio: nil,
    anchorPoint: .topLeft,
    constraintRect: .zero,
    minimumSize: .zero
  )

  path.append(.init(rect: rect))

  path
}

do {
  let path = UIBezierPath()

  var rect = CGRect(x: 10, y: 10, width: 10, height: 10)

  path.append(.init(rect: rect))

  rect.resizing(
    deltaWidth: 20,
    deltaHeight: 20,
    aspectRatio: nil,
    anchorPoint: .bottomRight,
    constraintRect: .zero,
    minimumSize: .zero
  )

  path.append(.init(rect: rect))

  path
}

do {
  let path = UIBezierPath()

  var rect = CGRect(x: 10, y: 10, width: 10, height: 10)

  path.append(.init(rect: rect))

  rect.resizing(
    deltaWidth: 20,
    deltaHeight: 20,
    aspectRatio: nil,
    anchorPoint: .bottomLeft,
    constraintRect: .zero,
    minimumSize: .zero
  )

  path.append(.init(rect: rect))

  path
}
