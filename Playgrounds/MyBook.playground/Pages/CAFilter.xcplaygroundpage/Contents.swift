import UIKit
import ObjectiveC

let CAFilterType = NSClassFromString("CAFilter") as! NSObject.Type

let ini: IMP = CAFilterType.method(for: "initWithType")!
objcget

typealias ClosureType = @convention(c) (AnyObject, Selector, String) -> Void
let sayHiTo : ClosureType = unsafeBitCast(ini, to: ClosureType.self)

//sayHiTo(CAFilterType, "initWithType", "gaussianBlur")

//obj.setValue("gaussianBlur", forKey: "name")
//
//dump(obj)
