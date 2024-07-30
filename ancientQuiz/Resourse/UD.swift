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
    
    var quizzComleted: Int {
        get {
            return defaults.integer(forKey: "quizzComleted", defaultValue: 0)
        }
        set {
            defaults.set(newValue, forKey: "quizzComleted")
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
   
    var sunGodExpert: Bool {
        get {
            return defaults.bool(forKey: "sunGodExpert")
        }
        set {
            defaults.set(newValue, forKey: "sunGodExpert")
        }
    }
    
    var underworldMaster: Bool {
        get {
            return defaults.bool(forKey: "underworldMaster")
        }
        set {
            defaults.set(newValue, forKey: "underworldMaster")
        }
    }
    
    var magicEnthusiast: Bool {
        get {
            return defaults.bool(forKey: "magicEnthusiast")
        }
        set {
            defaults.set(newValue, forKey: "magicEnthusiast")
        }
    }
    
    var skyGuardian: Bool {
        get {
            return defaults.bool(forKey: "skyGuardian")
        }
        set {
            defaults.set(newValue, forKey: "skyGuardian")
        }
    }
    
    var embalmer: Bool {
        get {
            return defaults.bool(forKey: "embalmer")
        }
        set {
            defaults.set(newValue, forKey: "embalmer")
        }
    }
    
    var chaosConqueror: Bool {
        get {
            return defaults.bool(forKey: "chaosConqueror")
        }
        set {
            defaults.set(newValue, forKey: "chaosConqueror")
        }
    }
    
    var wisdomSeeker: Bool {
        get {
            return defaults.bool(forKey: "wisdomSeeker")
        }
        set {
            defaults.set(newValue, forKey: "wisdomSeeker")
        }
    }
    
    var truthKeeper: Bool {
        get {
            return defaults.bool(forKey: "truthKeeper")
        }
        set {
            defaults.set(newValue, forKey: "truthKeeper")
        }
    }
    
    var joyBringer: Bool {
        get {
            return defaults.bool(forKey: "joyBringer")
        }
        set {
            defaults.set(newValue, forKey: "joyBringer")
        }
    }
    
    var homeProtector: Bool {
        get {
            return defaults.bool(forKey: "homeProtector")
        }
        set {
            defaults.set(newValue, forKey: "homeProtector")
        }
    }
    
    var coinCollector : Bool {
        get {
            return defaults.bool(forKey: "coinCollector")
        }
        set {
            defaults.set(newValue, forKey: "coinCollector")
        }
    }
    
    func countTrueAchievements() -> Int {
         let achievements = [
             sunGodExpert,
             underworldMaster,
             magicEnthusiast,
             skyGuardian,
             embalmer,
             chaosConqueror,
             wisdomSeeker,
             truthKeeper,
             joyBringer,
             homeProtector,
             coinCollector
         ]
         
         return achievements.filter { $0 }.count
     }
}

extension UserDefaults {
    func integer(forKey key: String, defaultValue: Int) -> Int {
        return self.object(forKey: key) as? Int ?? defaultValue
    }
}
