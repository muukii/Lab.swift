import Foundation

func render() -> String {
  
}

var mirror = Mirror(
  String.self,
  children: ["a": 1, "b": 2],
  displayStyle: .struct
)

struct MirrorWrapper: CustomReflectable {
  
  let customMirror: Mirror
  
  init(mirror: Mirror) {
    self.customMirror = mirror
  }
  
}

print(String(describing: MirrorWrapper(mirror: mirror)))


