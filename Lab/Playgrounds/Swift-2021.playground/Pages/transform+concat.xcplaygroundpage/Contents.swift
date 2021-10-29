
import UIKit

CGAffineTransform(scaleX: 0.7, y: 0.7).translatedBy(x: 100, y: 0)

CGAffineTransform(scaleX: 0.7, y: 0.7).concatenating(.init(translationX: 100, y: 0))

CGAffineTransform.init(translationX: 100, y: 0).concatenating(.init(scaleX: 0.7, y: 0.7))
