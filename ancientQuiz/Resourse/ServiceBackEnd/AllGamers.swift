//
//  AllGamers.swift


import Foundation

enum AllGamersError: Error {
    case unkonwn
    case noData
}

class AllGamers {

    static let shared = AllGamers()
    
    private init() {}
    
    private let urlString = "https://ancient-quiz-backend-7f8ceea5a2b9.herokuapp.com/api/players"

    func getLeadeboards(successCompletion: @escaping([Gamer]) -> Void, errorCompletion: @escaping (Error) -> Void) {

        guard let url = URL(string: urlString) else {
            print("Неверный URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
     
        
        guard let token = Auth.shared.token else { return }
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    errorCompletion(AllGamersError.noData)
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    errorCompletion(AllGamersError.unkonwn)
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let players = try decoder.decode([Gamer].self, from: data)
                DispatchQueue.main.async {
                    successCompletion(players)
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
}
