//
//  ServiceCalls.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/10.
//

import Foundation

protocol ServiceCallsProtocol {
    func login(username: String, password: String) -> Result<Login, APIError>
    func fetchEmployees() ->  Result<Employees, APIError>
    func fetchColors() -> Result<UserColor, APIError>
   // func updateUser(user: User, completion result: @escaping (Result<[Post], APIError>) -> Void)
    
    //Need to create UserColor, User and Employee models
    
}

class ServiceCalls: ServiceCallsProtocol, APICallService {
    
    func login(username: String, password: String) -> Result<Login, APIError> {
        let url = URL(string: "https://reqres.in/api/login")!
        let userRequest = UserRequest(username: username, password: password)
        let data = try? JSONEncoder().encode(userRequest)
        return postResources(url: url, body: data)
        
    }
    
    func fetchEmployees() ->  Result<Employees, APIError> {
        let url = URL(string: "https://reqres.in/api/users?page=1&per_page=12")!
        return fetchResources(url: url)
    }
    
    func fetchColors() -> Result<UserColor, APIError>  {
        let url = URL(string: "https://reqres.in/api/unknown?per_page=12")!
        return fetchResources(url: url)
    }
    
//    func updateUser(user: User, completion result: @escaping (Result<[Post], APIError>) -> Void) {
//        let url  = URL(string: "https://reqres.in/api/users")
//        return postResources(url: url, body: user, completion: result)
//        //convert from being a model to data aboject (obj of type data)
//    }
}
