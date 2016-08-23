import Foundation

/// `SessionTaskType` protocol represents a task for a request.
public protocol SessionTaskType: class {
    func resume()
    func cancel()
}

/// `SessionAdapterType` protocol provides interface to connect lower level networking backend with `Session`.
/// APIKit provides `URLSessionAdapter`, which conforms to `SessionAdapterType`, to connect `URLSession`
/// with `Session`.
public protocol SessionAdapterType {
    /// Returns instance that conforms to `SessionTaskType`. `handler` must be called after success or failure.
    func createTask(with URLRequest: URLRequest, handler: @escaping (Data?, URLResponse?, Error?) -> Void) -> SessionTaskType

    /// Collects tasks from backend networking stack. `handler` must be called after collecting.
    func getTasks(with handler: @escaping ([SessionTaskType]) -> Void)
}
