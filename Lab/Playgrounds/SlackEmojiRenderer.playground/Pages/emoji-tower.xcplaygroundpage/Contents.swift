func makeTower(emoji: String, height: Int) -> String {

  func space(_ count: Int) -> String {
    return Array.init(repeating: ":transparent-space:", count: count).joined(separator: "")
  }

  var lines: [String] = []

  (0..<height).forEach { i in

    lines.append(space(height - i - 1) + Array(repeating: emoji, count: i * 2 + 1).joined(separator: ""))

  }

  return lines.joined(separator: "\n")
}

print(makeTower(emoji: ":euro:", height: 10))
