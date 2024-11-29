import Alamofire

class NetworkingManager {
    static let shared = NetworkingManager()
    private let baseURL = "https://akabab.github.io/superhero-api/api/all.json"

    func fetchSuperheroes(completion: @escaping (Result<[Superhero], Error>) -> Void) {
        AF.request(baseURL).responseDecodable(of: [Superhero].self) { response in
            switch response.result {
            case .success(let superheroes):
                completion(.success(superheroes))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
