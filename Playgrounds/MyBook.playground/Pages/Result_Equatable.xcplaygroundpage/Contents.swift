
import Foundation

let result = Result<Int, Error>.success(1)

let a = result

let compared = a != result
