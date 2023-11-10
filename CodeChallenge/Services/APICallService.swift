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
    func fetchResources<T: Decodable>(url: URL, completion: @escaping (Result<T, APIError>) -> Void)
    func postResources<T: Decodable>(url: URL, body: Data?, completion: @escaping (Result<T, APIError>) -> Void)
    
}

extension APICallService {
    func fetchResources<T: Decodable>(url: URL, completion: @escaping (Result<T, APIError>) -> Void) {
        
        let internetReachability = Reachability()
        
        guard let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            completion(.failure(.invalidURL))
            return
        }
        
        guard let url = urlComponents.url else {
            completion(.failure(.invalidURL))
            return
        }
        
        
        if !internetReachability.isInternetAvailable() {
            completion(.failure(.networkError))
        }
        
        URLSession.shared.dataTask(with: url) { (result) in
            switch result {
            case .success(let (response, data)):
                
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode,
                    200..<299 ~= statusCode else {
                        completion(.failure(.requestFailed))
                        return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let value = try decoder.decode(T.self, from: data)
                    completion(.success(value))
                } catch {
                    completion(.failure(.decodeError))
                }
                
            case .failure(_):
                completion(.failure(.requestFailed))
            }
        }.resume()
        
    }
    
    func postResources<T: Decodable>(url: URL, body: Data?, completion: @escaping (Result<T, APIError>) -> Void) {
        guard Reachability().isInternetAvailable() else {
            completion(.failure(.networkError))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.requestFailed))
                print("DataTask error: \(error.localizedDescription)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                (200..<300).contains(httpResponse.statusCode) else {
                    completion(.failure(.requestFailed))
                    return
            }

            guard let data = data else {
                completion(.failure(.requestFailed))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let value = try decoder.decode(T.self, from: data)
                completion(.success(value))
            } catch {
                completion(.failure(.decodeError))
            }
        }

        task.resume()
    }
    
}
