//
//  Гіук.swift
//  TestTask-Voio
//
//  Created by  Sasha Khomenko on 27.03.2023.
//

import Foundation

struct User {
    let uid: String
    var firstName: String
    var lastName: String
    let email: String
    var profileImageUrl: URL?
    
    var fullName: String {
        firstName + " " + lastName
    }
    
    init(uid: String, dictionary: [String: AnyObject]) {
        self.uid = uid
        
        self.firstName = dictionary["firstName"] as? String ?? ""
        self.lastName = dictionary["lastName"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
    }
}