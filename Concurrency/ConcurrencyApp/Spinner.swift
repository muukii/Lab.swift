import SwiftUI

let frames = ["⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷"]

struct Spinner: View {

  @State var index = 0

  var body: some View {
    LoopTimelineView(frameCount: 8) { frame in
      Text(frames[frame])
    }

  }
}

private struct LoopTimelineView<Content: View>: View {

  struct InnerView: View {

    let date: Date
    let frameCount: Int
    let _content: (Int) -> Content
    @State var currentFrame = 0

    var body: some View {
      _content(currentFrame)
        .onChange(of: date) { newValue in
          withTransaction(Transaction()) {
            currentFrame += 1
            if currentFrame > (frameCount - 1) {
              currentFrame = 0
            }
          }
        }
    }
  }

  let frameCount: Int
  let _content: (Int) -> Content

  init(frameCount: Int, @ViewBuilder content: @escaping (Int) -> Content) {
    self.frameCount = frameCount
    self._content = content
  }

  var body: some View {
    TimelineView(.animation(minimumInterval: 0.05, paused: false)) { context in
      InnerView(date: context.date, frameCount: frameCount, _content: _content)
    }
  }
}

