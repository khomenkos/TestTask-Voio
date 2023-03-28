//
//  DatabaseManager.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import Firebase

struct DatabaseManager {
    
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    
    // MARK: - Public
    // Check if  email is available
    public func canCreateNewUser(firstName: String,
                                 lastName: String,
                                 email: String,
                                 completion: (Bool) -> Void) {
        completion(true)
    }
    
    // Inserts new user data to database
    public func insertNewUser(uid: String,
                              firstName: String,
                              lastName: String,
                              email: String,
                              completion: @escaping (Bool) -> Void) {
        
        let userData = ["firstName": firstName,
                        "lastName": lastName,
                        "email": email] as [String : Any]
        
        database.child("users").child(uid).setValue(userData) { error, _ in
            if error == nil {
                // Succeeded
                completion(true)
                return
            } else {
                // Failed
                completion(false)
                return
            }
        }
    }
    
    func fetchUser(uid: String, completion: @escaping(User) -> Void) {
        database.child("users").child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
            let user = User(uid: uid, dictionary: dictionary)
            completion(user)
        }
    }
}
