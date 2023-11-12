//
//  URLSession+Extension.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/10.

/**by using this URLSession extension, there is no need to write repetitive error-checking code for each data task.
 **It promotes code reuse and simplifies the process of handling network responses.
 */
//

import Foundation

extension URLSession {
    
    /**creates a standard data task using the  URL*/
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url, completionHandler: { (data, response, error) in
            
            /**If  error -> calls the closure with a failure result containing the encountered error**/
            if let error = error {
                result(.failure(error))
                return
            }
            
            /**calls the closure with a success result containing a tuple of (URLResponse, Data)**/
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            
            result(.success((response, data)))
        })
    }
    
    func dataTask(with request: URLRequest, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: request, completionHandler: { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            
            result(.success((response, data)))
        })
    }
}
