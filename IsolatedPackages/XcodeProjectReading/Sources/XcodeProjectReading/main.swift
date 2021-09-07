import Foundation
import XcodeProj
import PathKit

guard CommandLine.arguments.count == 3 else {
  let arg0 = Path(CommandLine.arguments[0]).lastComponent
  fputs("usage: \(arg0) <project> <new-version>\n", stderr)
  exit(1)
}

let projectPath = Path(CommandLine.arguments[1])
let newVersion = CommandLine.arguments[2]
let xcodeproj = try XcodeProj(path: projectPath)
let key = "CURRENT_PROJECT_VERSION"

for conf in xcodeproj.pbxproj.buildConfigurations where conf.buildSettings[key] != nil {
  conf.buildSettings[key] = newVersion
}
