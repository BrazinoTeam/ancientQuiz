//
//  Auth.swift

import Foundation

class Auth {
    
    static let shared = Auth()
    
    var token: String?
    
    let username = "admin"
    let password = "68137hbSaoOF"
    let logoNameAuth = "GodsRa"
    let url = URL(string: "https://ancient-quiz-backend-7f8ceea5a2b9.herokuapp.com/login")!
    var request: URLRequest
    
    init() {
        request = URLRequest(url: url)
        request.httpMethod = "POST"
        let loginString = "\(username):\(password)"
        if let loginData = loginString.data(using: String.Encoding.utf8) {
            let base64LoginString = loginData.base64EncodedString(options: [])
            request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        }
    }
    
    struct AuthResponse: Codable {
        let token: String?
    }

    func tokenAuth() async throws {
        do {
            let config = URLSessionConfiguration.default
                   config.urlCache = nil
                   config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
                   let session = URLSession(configuration: config)
            let (data, _) = try await session.data(for: request)
            let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
            self.token = authResponse.token
            print("token -- \(token)")
        } catch {
            throw error
        }
    }
    
}

