import SwiftUI

struct ThrowingGroup<SuccessView: View, ErrorView: View>: View {
  
  private var successView: SuccessView? = nil
  private var errorView: ErrorView? = nil
  
  init(@ViewBuilder _ operation: () throws -> SuccessView, @ViewBuilder errorView: (Error) -> ErrorView) {
    do {
      self.successView = try operation()
    } catch {
      self.errorView = errorView(error)
    }
  }
  
  var body: some View {
    if let successView = successView {
      successView
    } else {
      errorView
    }
  }
  
}
