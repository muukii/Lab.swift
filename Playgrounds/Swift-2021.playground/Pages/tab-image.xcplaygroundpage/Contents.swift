import SwiftUI
import Foundation

extension View {
  func snapshot(scale: CGFloat) -> UIImage {
    
    let controller = UIHostingController(rootView: self)
    let view = controller.view

    let targetSize = controller.view.intrinsicContentSize
    view?.bounds = CGRect(origin: .zero, size: targetSize)
    view?.backgroundColor = .clear

    let format = UIGraphicsImageRendererFormat()
    format.scale = scale

    let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)

    return renderer.image { _ in
      view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
    }
  }
}

struct PackageThumbnail: View {

  var title: String

  var body: some View {
    ZStack {
      Color.init(white: 0.8, opacity: 1)
      Text(title)
        .font(.system(size: 20).bold())
        .foregroundColor(.black)
        .padding(4)
    }
    .frame(width: 44, height: 44, alignment: .center)
  }

}

let basePath = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!

for i in 0..<50 {
  let image = PackageThumbnail(title: "\(i)").snapshot(scale: 1)
  let url = URL(string: "\(basePath.absoluteString)/\(i).png")!
  print("Write =>", url.absoluteString)
  try! image.pngData()!.write(to: url)
}

