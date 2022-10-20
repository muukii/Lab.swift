import SerialDSL

public struct Endpoint: SerialView {
  
  public var methods: [Method]
  
  public var body: some SerialView {
    Object {
      for method in methods {
        Member(method.method.rawValue) {
          method
        }
      }
    }
  }
}

public struct Method: SerialView {
  
  public enum HTTPMethod: String {
    case get
    case post
    case put
    case delete
  }

  public var method: HTTPMethod
  public var summary: String
  public var description: String
  public var operationID: String
  public var tags: [String]
      
  public var body: some SerialView {
    Object {
      Member("operationId") { operationID }
      Member("description") { description }
      Member("summary") { summary }
      Member("tags") { tags }
    }
  }
}

let endpoint = Endpoint(methods: [
  .init(method: .get, summary: "Hello", description: "Hello Get Method", operationID: "id", tags: ["Awesome API"])
])

print(endpoint.renderJSON())
