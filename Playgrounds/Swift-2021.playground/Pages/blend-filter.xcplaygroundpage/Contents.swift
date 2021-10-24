import CoreImage

let r = CIFilter
  .filterNames(inCategory: nil) // fetch all the available filters
  .filter { $0.contains("Compositing")}
  .map {
    let capitalizedFilter = $0.dropFirst(2) // drop the CIn prefix
    let first = capitalizedFilter.first! // fetch the first letter
    // lowercase the first letter and drop the `Compositing` suffix
    return "\(first.lowercased())\(capitalizedFilter.dropFirst().dropLast("Compositing".count))"
  } + ["Clear Filter"]

print(r)
