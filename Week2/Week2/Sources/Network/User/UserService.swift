//
//  UserService.swift
//  Week2
//
//  Created by 김승원 on 11/2/24.
//

import Foundation
import Alamofire

class UserService {
    static let shared = UserService()
    private init() {}
    
    typealias RegisterNetworkCompletion = (Result<Bool, NetworkError>) -> Void
    typealias LoginNetworkCompletion = (Result<LoginResponse, NetworkError>) -> Void
    typealias UpdateUserInfoNetworkCompletion = (Result<Bool, NetworkError>) -> Void
    typealias GetHobbyNetworkCompletion = (Result<HobbyResponse, NetworkError>) -> Void
    
    // 회원 가입
    func register(username: String, password: String, hobby: String, completion: @escaping (RegisterNetworkCompletion)) {
        let url = Environment.baseURL + "/user"
        let parameters = RegisterRequest(username: username, password: password, hobby: hobby)
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).validate().response { [weak self] response in
            guard let statusCode = response.response?.statusCode, let data = response.data, let self else {
                completion(.failure(.unknownError))
                return
            }
            switch response.result {
            case .success:
                completion(.success(true))
                
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    // 로그인
    func login(username: String, password: String, completion: @escaping (LoginNetworkCompletion)) {
        let url = Environment.baseURL + "/login"
        let parameters = LoginRequest(username: username, password: password)
        
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).validate().response { [weak self] response in
            guard let statusCode = response.response?.statusCode, let data = response.data, let self else {
                completion(.failure(.unknownError))
                return
            }
            switch response.result {
            case .success:
                if let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) {
                    completion(.success(loginResponse))
                } else {
                    completion(.failure(.decodingError))
                }
                
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    // 유저 정보 변경
    func updateUserInfo(token: String, hobby: String, password: String, completion: @escaping (UpdateUserInfoNetworkCompletion)) {
        let url = Environment.baseURL + "/user"
        let headers: HTTPHeaders = ["token": token]
        let parameters = UpdateUserInfoRequest(hobby: hobby, password: password)
        
        AF.request(url, method: .put, parameters: parameters, encoder: JSONParameterEncoder.default, headers: headers).validate().response { [weak self] response in
            guard let statusCode = response.response?.statusCode, let self else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success:
                completion(.success(true))
                
            case .failure:
                if let data = response.data {
                    let error = self.handleStatusCode(statusCode, data: data)
                    completion(.failure(error))
                }
            }
        }
    }
    
    // 내 취미 조회
    func getMyHobby(token: String, completion: @escaping (GetHobbyNetworkCompletion)) {
        let url = Environment.baseURL + "/user/my-hobby"
        let headers: HTTPHeaders = ["token": token]
        
        AF.request(url, method: .get, headers: headers).validate().response { [weak self] response in
            guard let statusCode = response.response?.statusCode, let data = response.data, let self else {
                completion(.failure(.unknownError))
                return
            }
            
            switch response.result {
            case .success:
                if let hobbyResponse = try? JSONDecoder().decode(HobbyResponse.self, from: data) {
                    completion(.success(hobbyResponse))
                } else {
                    completion(.failure(.decodingError))
                }
                
            case .failure:
                let error = self.handleStatusCode(statusCode, data: data)
                completion(.failure(error))
            }
        }
    }
    
    func handleStatusCode(_ statusCode: Int, data: Data) -> NetworkError {
        let errorCode = decodeError(data: data)
        switch (statusCode, errorCode) {
        case (400, "00"):
            return .invalidRequest
        case (400, "01"):
            return .expressionError
        case (404, ""):
            return .invalidURL
        case (409, "00"):
            return .duplicateError
        case (500, ""):
            return .serverError
        default:
            return .unknownError
        }
    }
    
    func decodeError(data: Data) -> String {
        guard let errorResponse = try? JSONDecoder().decode(ErrorResponse.self, from: data) else { return "" }
        return errorResponse.code
    }
}
