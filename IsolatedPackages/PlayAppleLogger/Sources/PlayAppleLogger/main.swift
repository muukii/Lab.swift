// 1) let's import the logging API package
import Logging

struct MyLogHandler: LogHandler {

  public subscript(metadataKey metadataKey: String) -> Logger.Metadata.Value? {
    get {
      return self.metadata[metadataKey]
    }
    set {
      self.metadata[metadataKey] = newValue
    }
  }
  
  var metadata: Logger.Metadata

  var logLevel: Logger.Level

}

// 2) we need to create a logger, the label works similarly to a DispatchQueue label
let logger = Logger(label: "com.example.BestExampleApp.main")

LoggingSystem
// 3) we're now ready to use it
logger.info("Hello World!")
