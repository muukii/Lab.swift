import ImageIO
import UIKit

let image: UIImage = #imageLiteral(resourceName: "image_p3.jpeg")

func writeImageToTmpDirectory(image: UIImage) -> URL? {
  let directory = NSTemporaryDirectory()
  let fileName = UUID().uuidString
  let path =  directory + "/" + fileName
  let destination = URL(fileURLWithPath: path)
  
  guard let data = image.pngData() else {
    return nil
  }
  
  do {
    try data.write(to: destination, options: [])
  } catch {
    return nil
  }
  
  return destination
}

guard let url = writeImageToTmpDirectory(image: image) else {
  fatalError()
}

let provider = CGDataProvider(url: url as CFURL)!

let imageSource = CGImageSourceCreateWithDataProvider(provider, [:] as CFDictionary)!

let options: [AnyHashable : Any] = [
  kCGImageSourceThumbnailMaxPixelSize: 300,
  kCGImageSourceCreateThumbnailFromImageAlways: true,
  kCGImageSourceCreateThumbnailWithTransform: true
]
let scaledImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0, options as CFDictionary).flatMap { UIImage(cgImage: $0) }

scaledImage
