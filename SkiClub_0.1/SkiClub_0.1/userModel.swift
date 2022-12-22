//
//  userModel.swift
//  SkiClub_0.1
//
//  Created by Bradley J Curci on 12/21/22.
//

import Foundation

struct Response: Codable {
    var items: [Items]
}

struct Items: Codable {
    
    //Member ID
    var id: String
    
    //DOB
    var field_75: String
    
    //Grade Level
    var field_62: String
    
    //email
    var field_63: String
    
    
}
