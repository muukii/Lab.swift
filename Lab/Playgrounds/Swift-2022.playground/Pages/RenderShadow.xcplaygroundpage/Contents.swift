import UIKit

func renderShadow() {

  let renderer = UIGraphicsImageRenderer(size: .init(width: 100, height: 100))

  let image = renderer.image { rendererContext in
    let cgContext = rendererContext.cgContext
    
    let boundingRect = cgContext.boundingBoxOfClipPath
    

    cgContext.setShadow(offset: .init(width: 0, height: 0), blur: 10, color: UIColor.red.cgColor)
    
//    cgContext.setBlendMode(.multiply)

    let path = UIBezierPath(
      roundedRect: .init(x: 10, y: 10, width: 10, height: 10),
      cornerRadius: 3
    )

    let invertedPath = UIBezierPath(roundedRect: .init(x: 0, y: 0, width: 30, height: 30), cornerRadius: 3)
    invertedPath.usesEvenOddFillRule = true
    invertedPath.append(path)
    
    invertedPath.addClip()
    
    cgContext.setStrokeColor(UIColor.red.cgColor)
    cgContext.addPath(path.cgPath)
    cgContext.fillPath()

   
    
  }
  
  let imageView = UIImageView(image: image)
  imageView.sizeToFit()
  let view = UIView()
  view.backgroundColor = .white
  view.frame = imageView.bounds
  view.addSubview(imageView)

  view
}

DispatchQueue.global().sync {
  renderShadow()
}
