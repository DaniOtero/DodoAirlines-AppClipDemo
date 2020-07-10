//
//  User.swift
//  DodoAirlines (iOS)
//
//  Created by Daniel Otero on 10/07/2020.
//

import Foundation

struct User {
    enum Level {
        case bronze, silver, gold
    }
    
    var name: String
    var surname: String
    var NookMiles: Int
    var level: Level
}
