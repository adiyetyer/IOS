import Foundation

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
    let fullName: String?
}

struct Images: Codable {
    let lg: String
}
