import Combine
import _Concurrency

extension _Concurrency.Task {
  public func makeFuture() -> Future<Success, Failure>
  where Failure == Swift.Error {
    return Future { promise in
      Task<Void, Failure> {
        do {
          let value = try await self.value
          promise(.success(value))
        } catch {          
          promise(.failure(error))
        }
      }
    }
  }

}
