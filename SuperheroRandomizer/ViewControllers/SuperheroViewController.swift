import UIKit
import Kingfisher

class ViewController: UIViewController {
    private var superheroes: [Superhero] = []
    private var currentSuperhero: Superhero?

    // UI элементы
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let statsLabel = UILabel()
    private let randomizeButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchSuperheroes()
    }

    private func fetchSuperheroes() {
        NetworkingManager.shared.fetchSuperheroes { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let superheroes):
                    self?.superheroes = superheroes
                    self?.showRandomSuperhero()
                case .failure(let error):
                    self?.showError(error.localizedDescription)
                }
            }
        }
    }

    private func showRandomSuperhero() {
        guard !superheroes.isEmpty else { return }
        currentSuperhero = superheroes.randomElement()
        updateUI()
    }

    private func updateUI() {
        guard let superhero = currentSuperhero else { return }
        nameLabel.text = superhero.name
        statsLabel.text = """
        Intelligence: \(superhero.powerstats.intelligence)
        Strength: \(superhero.powerstats.strength)
        Speed: \(superhero.powerstats.speed)
        """
        if let imageUrl = URL(string: superhero.images.lg) {
            imageView.kf.setImage(with: imageUrl)
        }
    }

    private func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    @objc private func randomizeTapped() {
        showRandomSuperhero()
    }
    
}

private func setupUI() {
    view.backgroundColor = .white

    
}

