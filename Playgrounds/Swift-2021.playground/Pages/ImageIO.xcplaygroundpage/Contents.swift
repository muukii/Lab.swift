import ImageIO
import UIKit

let image: UIImage = #imageLiteral(resourceName: "image_p3.jpeg")

func size(of imageSource: CGImageSource) -> CGSize? {
  let propertiesOptions = [kCGImageSourceShouldCache: false] as CFDictionary
  guard let properties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, propertiesOptions) as? [CFString: Any] else {
    return nil
  }
  
  guard
    let width = properties[kCGImagePropertyPixelWidth] as? CGFloat,
    let height = properties[kCGImagePropertyPixelHeight] as? CGFloat
  else {
    return nil
  }
  return CGSize(width: width, height: height)
}


func writeImageToTmpDirectory(image: UIImage) -> URL? {
  let directory = NSTemporaryDirectory()
  let fileName = UUID().uuidString
  let path = directory + "/" + fileName
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

size(of: imageSource)

// Take an image scaled
let scaledImage = CGImageSourceCreateThumbnailAtIndex(
  imageSource, 0, [
    kCGImageSourceThumbnailMaxPixelSize: 300,
    kCGImageSourceCreateThumbnailFromImageAlways: true,
    kCGImageSourceCreateThumbnailWithTransform: true,
  ] as CFDictionary
)
.flatMap { UIImage(cgImage: $0) }

// Take an image as original
let originalImage = CGImageSourceCreateImageAtIndex(imageSource, 0, [:] as CFDictionary)

scaledImage
