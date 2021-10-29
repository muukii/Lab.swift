import DeviceCheck
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

if DCDevice.current.isSupported {
  print("b")
  DCDevice.current.generateToken { token, error in
    guard error == nil else {
      print(error)
      return
      /* Handle the error. */
    }

    print(token)
    print(token?.map { String(format: "%.2hhx", $0) }.joined())
    // Send the token to your server.
  }
} else {
  print("a")
}
