//
//  UD.swift

import Foundation
class UD {
    
    static let shared = UD()
    
    private let defaults = UserDefaults.standard
    
    var scorePoints: Int {
        get {
            return defaults.integer(forKey: "scorePoints", defaultValue: 0)
        }
        set {
            defaults.set(newValue, forKey: "scorePoints")
        }
    }
    
    var answerQuestions: Int {
        get {
            return defaults.integer(forKey: "answerQuestions", defaultValue: 0)
        }
        set {
            defaults.set(newValue, forKey: "answerQuestions")
        }
    }
    
    var lastBonusDate: Date? {
        get {
            return defaults.object(forKey: "lastBonusDate") as? Date
        }
        set {
            defaults.set(newValue, forKey: "lastBonusDate")
        }
    }
    
    var userName: String? {
        get {
            return defaults.string(forKey: "userName")
        }
        set {
            defaults.set(newValue, forKey: "userName")
        }
    }
    
    var userID: Int? {
        get {
            return defaults.object(forKey: "userID") as? Int
        }
        set {
            defaults.set(newValue, forKey: "userID")
        }
    }
   
}

extension UserDefaults {
    func integer(forKey key: String, defaultValue: Int) -> Int {
        return self.object(forKey: key) as? Int ?? defaultValue
    }
}
