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
    var id: String
    var field_75: String
    var field_62: String
}
