//
//  APICallService.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/10.
//

import Foundation

protocol APICallService {
    /// A generic function to use when fetching data from a url
    ///
    /// - Parameters:
    ///   - url: The endpoint to get data from
    ///   - completion: Response from the service call in the form of a `Result<T, ServiceError>` with a ServiceError obect
    func fetchResources<T: Decodable>(url: URL) -> Result<T, APIError>
    func postResources<T: Decodable>(url: URL, body: Data?) -> Result<T, APIError>
    
}

extension APICallService {
    func fetchResources<T: Decodable>(url: URL) -> Result<T, APIError> {
        let internetReachability = Reachability()

        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            return .failure(.invalidURL)
        }

        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }

        if !internetReachability.isInternetAvailable() {
            return .failure(.networkError)
        }

        do {
            let (data, response) = try URLSession.shared.synchronousDataTask(with: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<299).contains(httpResponse.statusCode) else {
                return .failure(.requestFailed)
            }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let value = try decoder.decode(T.self, from: data)

            return .success(value)
        } catch {
            return .failure(.requestFailed)
        }
    }

    func postResources<T: Decodable>(url: URL, body: Data?) -> Result<T, APIError> {
        guard Reachability().isInternetAvailable() else {
            return .failure(.networkError)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let (data, response) = try URLSession.shared.synchronousDataTask(with: request)

            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<299).contains(httpResponse.statusCode) else {
                return .failure(.requestFailed)
            }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let value = try decoder.decode(T.self, from: data)

            return .success(value)
        } catch {
            return .failure(.requestFailed)
        }
    }
}

extension URLSession {
    func synchronousDataTask(with url: URL) throws -> (Data, URLResponse) {
        var data: Data?
        var response: URLResponse?
        var error: Error?

        let semaphore = DispatchSemaphore(value: 0)

        dataTask(with: url) {
            data = $0
            response = $1
            error = $2
            semaphore.signal()
        }.resume()

        semaphore.wait()

        if let error = error {
            throw error
        }

        guard let responseData = data, let response = response else {
            throw NSError(domain: "Invalid response or data", code: 0, userInfo: nil)
        }

        return (responseData, response)
    }

    func synchronousDataTask(with request: URLRequest) throws -> (Data, URLResponse) {
        var data: Data?
        var response: URLResponse?
        var error: Error?

        let semaphore = DispatchSemaphore(value: 0)

        dataTask(with: request) {
            data = $0
            response = $1
            error = $2
            semaphore.signal()
        }.resume()

        semaphore.wait()

        if let error = error {
            throw error
        }

        guard let responseData = data, let response = response else {
            throw NSError(domain: "Invalid response or data", code: 0, userInfo: nil)
        }

        return (responseData, response)
    }
}
