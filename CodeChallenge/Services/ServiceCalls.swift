//
//  ServiceCalls.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/10.
//

import Foundation

/**Declares  methods that represent different API calls**/
protocol ServiceCallsProtocol {
    func login(username: String, password: String) -> Result<Login, APIError>
    func fetchEmployees() ->  Result<Employees, APIError>
    func fetchColors() -> Result<UserColor, APIError>
    func updateUser(user: UserInfo) ->  Result<UserInfo, APIError>
        
}

class ServiceCalls: ServiceCallsProtocol, APICallService {
    /**implementations for the methods declared in the ServiceCallsProtocol above**/
    func login(username: String, password: String) -> Result<Login, APIError> {
        /**Constructs a URL**/
        let url = URL(string: "https://reqres.in/api/login")!
        /**Creates a UserRequest object with the provided username and password **/
        let userRequest = UserRequest(username: username, password: password)
        /**encodes it to JSON, and then calls the postResources method from the APICallService protocol to perform a POST request.**/
        let data = try? JSONEncoder().encode(userRequest)
        return postResources(url: url, body: data)
        
    }
    
    /** Construct URLs and call the fetchResources method from the APICallService protocol to perform GET requests. **/
    func fetchEmployees() ->  Result<Employees, APIError> {
        let url = URL(string: "https://reqres.in/api/users?page=1&per_page=12")!
        return fetchResources(url: url)
    }
    
    
    /**Fetches user colors and returns a Result type containing either a UserColor object or an APIError.**/
    func fetchColors() -> Result<UserColor, APIError>  {
        let url = URL(string: "https://reqres.in/api/unknown?per_page=12")!
        return fetchResources(url: url)
    }
    
    func updateUser(user: UserInfo) ->  Result<UserInfo, APIError>  {
        guard let url  = URL(string: "https://reqres.in/api/users"),
              let requestBody = try? JSONEncoder().encode(user) else {
            return .failure(.invalidURL)
        }
        return postResources(url: url, body: requestBody)
        //convert from being a model to data aboject (obj of type data)
    }
}
