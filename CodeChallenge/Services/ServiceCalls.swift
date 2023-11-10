//
//  ServiceCalls.swift
//  CodeChallenge
//
//  Created by DA MAC M1 157 on 2023/11/10.
//

import Foundation

protocol ServiceCallsProtocol {
    func login(username: String, password: String, completion result: @escaping (Result<Login, APIError>) -> Void)
    func fetchEmployees(completion result: @escaping (Result<[Employee], APIError>) -> Void)
    func fetchColors(completion result: @escaping (Result<[UserColor], APIError>) -> Void)
   // func updateUser(user: User, completion result: @escaping (Result<[Post], APIError>) -> Void)
    
    //Need to create UserColor, User and Employee models
    
}

class ServiceCalls: ServiceCallsProtocol, APICallService {
    
    func login(username: String, password: String, completion result: @escaping (Result<Login, APIError>) -> Void){
        let url = URL(string: "https://reqres.in/api/login")!
        let userRequest = UserRequest(username: username, password: password)
        let data = try? JSONEncoder().encode(userRequest)
        return postResources(url: url, body: data, completion: result)
        
    }
    
    func fetchEmployees(completion result: @escaping (Result<[Employee], APIError>) -> Void) {
        let url = URL(string: "https://reqres.in/api/users?page=1&per_page=12")!
        return fetchResources(url: url, completion: result)
    }
    
    func fetchColors(completion result: @escaping (Result<[UserColor], APIError>) -> Void) {
        let url = URL(string: "https://reqres.in/api/unknown?per_page=12")!
        return fetchResources(url: url, completion: result)
    }
    
//    func updateUser(user: User, completion result: @escaping (Result<[Post], APIError>) -> Void) {
//        let url  = URL(string: "https://reqres.in/api/users")
//        return postResources(url: url, body: user, completion: result)
//        //convert from being a model to data aboject (obj of type data)
//    }
}
