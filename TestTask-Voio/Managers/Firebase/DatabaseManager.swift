//
//  DatabaseManager.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import Firebase
import FirebaseStorage

struct DatabaseManager {
    
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    private let storage = Storage.storage().reference()
    
    // MARK: - Public
    // Check if  email is available
    public func canCreateNewUser(firstName: String,
                                 lastName: String,
                                 email: String,
                                 profileImage: UIImage,
                                 completion: (Bool) -> Void) {
        completion(true)
    }
    
    // Inserts new user data to database
    public func insertNewUser(uid: String,
                              firstName: String,
                              lastName: String,
                              email: String,
                              profileImage: UIImage,
                              completion: @escaping (Bool) -> Void) {
        
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = storage.child("profile_images").child(filename)
        
        storageRef.putData(imageData, metadata: nil) { (_, _) in
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                let userData = ["firstName": firstName,
                                "lastName": lastName,
                                "email": email,
                                "profileImage": profileImageUrl] as [String : Any]
                
                self.database.child("users").child(uid).setValue(userData) { error, _ in
                    if error == nil {
                        completion(true)
                        return
                    } else {
                        completion(false)
                        return
                    }
                }
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
