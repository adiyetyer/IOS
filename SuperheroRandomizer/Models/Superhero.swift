import Foundation
import SwiftUI
import Alamofire


struct Superhero: Codable {
    let id: Int
    let name: String
    let powerstats: PowerStats
    let biography: Biography
    let images: Images
}

struct PowerStats: Codable {
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
}

struct Biography: Codable {
    let fullName: String
    let placeOfBirth: String?
    let firstAppearance: String?
    let publisher: String?
    let alignment: String?
}

struct Images: Codable {
    let lg: String 
}
