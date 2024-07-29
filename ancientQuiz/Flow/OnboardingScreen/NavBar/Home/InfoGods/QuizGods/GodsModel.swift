//
//  GodsModel.swift


import Foundation

struct GodsModel: Decodable {
    struct Gods: Decodable {
        
        struct Quiz: Decodable {
            
            struct Question: Decodable {
                struct Variant: Decodable {
                    var text: String
                    var isRight: Bool
                }
                var question: String
                var variants: [Variant]
            }
            
            var quizDurationMinutes: Int
            var questions: [Question]
        }
        
        var id: Int
        var name: String
        var photoName: String
        var info: String
        var infoDurationMinutes: Int
        var quiz: Quiz
    }
    
    var gods: [Gods]
}

extension GodsModel {
    
    static func getAirplanetFromFile() -> [GodsModel.Gods] {
        guard let url = Bundle.main.url(forResource: "jsonData", withExtension: "json") else {
            return []
        }
        guard let data = try? Data(contentsOf: url) else {
            return []
        }
        guard let model = try? JSONDecoder().decode(GodsModel.self, from: data) else {
            return []
        }
        return model.gods
    }
    
}
