//
//  NetworkManager.swift
//  CornellTypes
//
//  Created by Alvaro Deras on 11/24/23.
//

import Alamofire
import Foundation

class NetworkManager {
    
    // Shared singleton instance
    static let shared = NetworkManager()
    
    // Endpoint
    private let baseUrl = "http://34.48.21.54"
    
    // JSON Decoder
    private let decoder = JSONDecoder()
    
    private init() {
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    // MARK: - Requests
    
    func getUserByUsername(username: String, completion: @escaping (User) -> Void) {
        let endpoint = "\(baseUrl)/api/users/\(username)/"
        
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: User.self, decoder: decoder) { response in
                switch response.result {
                case .success(let user):
                    completion(user)
                case .failure(let error):
                    print("Error in NetworkManager.getUserByUsername: \(error.localizedDescription)")
                }
            }
    }
    
    func registerUser(email: String, username: String, password: String, school: String, completion: @escaping () -> Void) {
        let endpoint = "\(baseUrl)/api/users/register/"
        
        let parameters: Parameters = [
            "email": email,
            "username": username,
            "password": password,
            "school": school
        ]
        
        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .response { response in
                switch response.result {
                case .success(_):
                    completion()
                case .failure(let error):
                    print("Error in NetworkManager.registerUser: \(error.localizedDescription)")
                }
            }
    }
    
    func verifyUser(code: String, completion: @escaping () -> Void) {
        let endpoint = "\(baseUrl)/api/users/verify/\(code)/"
        
        AF.request(endpoint, method: .get)
            .validate()
            .response { response in
                switch response.result {
                case .success(_):
                    completion()
                case .failure(let error):
                    print("Error in NetworkManager.verifyUser: \(error.localizedDescription)")
                }
            }
    }
    
    func enterMBTI(user: User, type: String, completion: @escaping (String) -> Void) {
        let endpoint = "\(baseUrl)/api/users/\(user.username)/personality/"
        
        let parameters: Parameters = [
            "personality_type": type
        ]
        
        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: String.self, decoder: decoder) { response in
                switch response.result {
                case .success(let mbti):
                    print("Successfully assigned MBTI")
                    completion(mbti)
                case .failure(let error):
                    print("Error in NetworkManager.enterMBTI: \(error.localizedDescription)")
                }
                
            }
    }
    
    func getPosts(completion: @escaping ([Post]) -> Void) {
        let endpoint = "\(baseUrl)/api/posts"
        
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: [Post].self, decoder: decoder) { response in
                switch response.result {
                case .success(let posts):
                    completion(posts)
                case .failure(let error):
                    print("Error in NetworkManager.getPosts: \(error.localizedDescription)")
                }
            }
    }
    
    func getQuestion(questionId: Int, completion: @escaping (Question?) -> Void) {
        let endpoint = "\(baseUrl)/api/surveys/\(questionId)"
        
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: Question.self, decoder: decoder) { response in
                switch response.result {
                case .success(let question):
                    completion(question)
                case .failure(let error):
                    print("Error in NetworkManager.getQuestion: \(error.localizedDescription)")
                    completion(nil)
                }
            }
    }
    
    func submitSpecificResponse(user: User, questionId: Int, score: String, completion: @escaping () -> Void) {
        let endpoint = "\(baseUrl)/api/surveys/\(user.username)/\(questionId)/"
        
        let parameters: Parameters = [
            "score": score
        ]
        
        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .response { response in
                switch response.result {
                case .success(_):
                    completion()
                case .failure(let error):
                    print("Error in NetworkManager.submitSpecificResponse: \(error.localizedDescription)")
                }
            }
    }
    
    func getResults(user: User, completion: @escaping (User) -> Void) {
        let endpoint = "\(baseUrl)/api/surveys/\(user.username)/results"
        
        AF.request(endpoint, method: .get)
            .validate()
            .responseDecodable(of: User.self, decoder: decoder) { response in
                switch response.result {
                case .success(let user):
                    completion(user)
                case .failure(let error):
                    print("Error in NetworkManager.getUserByUsername: \(error.localizedDescription)")
                }
            }
    }
    
    func createPost(user: User, text: String, completion: @escaping () -> Void) {
        let endpoint = "\(baseUrl)/api/users/\(user.username)/posts/"
        
        let parameters: Parameters = [
            "text": text
        ]
        
        AF.request(endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .response { response in
                switch response.result {
                case .success(_):
                    completion()
                case .failure(let error):
                    print("Error in NetworkManager.createPost: \(error.localizedDescription)")
                }
            }
    }
}
