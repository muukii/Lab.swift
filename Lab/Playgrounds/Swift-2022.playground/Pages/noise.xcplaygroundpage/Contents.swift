import GameKit

let noise = GKNoise(GKPerlinNoiseSource())
let noiseMap = GKNoiseMap(noise, size: .init(1, 1), origin: .init(0, 0), sampleCount: .init(1000, 1000), seamless: true)

for x in (0..<1000) {
  let _x = noiseMap.value(at: .init(Int32(x), 1))
}

print("Done")
