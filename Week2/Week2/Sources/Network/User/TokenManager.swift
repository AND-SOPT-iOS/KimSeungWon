//
//  TokenManager.swift
//  Week2
//
//  Created by 김승원 on 11/6/24.
//

import Foundation
import Security

class TokenManager {
    static let shared = TokenManager()
    private init() {}
    private let tokenKey = "authToken"  // 저장될 키
    
    func saveToken(_ token: String) {
        guard let data = token.data(using: .utf8) else { return }
        
        // 기존에 저장된 토큰이 있다면 먼저 삭제
        deleteToken()
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: tokenKey,
            kSecValueData as String: data
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        if status != errSecSuccess {
            print("토큰 저장 실패: \(status)")
        } else {
            print("토큰 저장 성공: \(status)")
        }
    }
    
    func getToken() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: tokenKey,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var item: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        guard status == errSecSuccess, let data = item as? Data,
              let token = String(data: data, encoding: .utf8) else {
            print("토큰 불러오기 실패: \(status)")
            return nil
        }
        
        print("토큰 불러오기 성공: \(status)")
        return token
    }
    
    func deleteToken() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: tokenKey
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        if status != errSecSuccess {
            print("토큰 삭제 실패: \(status)")
        } else {
            print("토큰 삭제 성공: \(status)")
        }
    }
}
