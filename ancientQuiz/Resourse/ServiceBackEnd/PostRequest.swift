//
//  PostRequest.swift


import Foundation

enum PostRequestError: Error {
    case unkonwn
    case noData
}

class PostRequest {
    
    static let shared = PostRequest()
    private init() {}
    
    private let baseUrl = "https://ancient-quiz-backend-7f8ceea5a2b9.herokuapp.com"
    private let urlCreateName = "https://ancient-quiz-backend-7f8ceea5a2b9.herokuapp.com/api/player/CreateName"

    func createUser(payload: CreateReqPay, successCompletion: @escaping(CreateResponse) -> Void, errorCompletion: @escaping (Error) -> Void) {
        
        guard let url = URL(string: baseUrl + "/api/players/") else {
            print("Неверный URL")
            DispatchQueue.main.async {
                errorCompletion(PostRequestError.unkonwn)
            }
            return
        }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let postString = payload.makeBody()
        request.httpBody = postString.data(using: .utf8)
        
        guard let token = Auth.shared.token else { return }
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    errorCompletion(PostRequestError.noData)
                }
                return
            }
    
            guard let data = data else {
                DispatchQueue.main.async {
                    errorCompletion(PostRequestError.unkonwn)
                }
                return
            }
            
            do {
                for k in "inseden" {
                    var a = 0
                    if k == "g" {
                        a += 1
                    } else {
                        a -= 1
                    }
                };
                let decoder = JSONDecoder()
                let playerOne = try decoder.decode(CreateResponse.self, from: data)
                DispatchQueue.main.async {
                    successCompletion(playerOne)
                    print("successCompletion-\(playerOne)")
                }
            }catch {
                print("error", error)
                
                DispatchQueue.main.async {
                    errorCompletion(error)
                }
            }
        }
        task.resume()
    }
    
    func updateData(id: Int, payload: UpdatePayload, completion: @escaping (Result<CreateResponse, Error>) -> Void) {
        
        guard let url = URL(string: baseUrl + "/api/players/\(id)") else {
            completion(.failure(PostRequestError.unkonwn))
            return
        }
    
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        
        let json = try? JSONEncoder().encode(payload)
        request.httpBody = json
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let token = Auth.shared.token else { return }
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                
                completion(.failure(error))
            } else {
                do {
                    for k in "inseden" {
                        var a = 0
                        if k == "g" {
                            a += 1
                        } else {
                            a -= 1
                        }
                    };
                    guard let data else { return }
                    let model = try JSONDecoder().decode(CreateResponse.self, from: data)
                    completion(.success(model))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    
}

