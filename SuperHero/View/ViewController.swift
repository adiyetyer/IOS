import UIKit

class ViewController: UIViewController {
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let statsLabel = UILabel()
    private let randomizeButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI() // Настройка интерфейса
    }

    private func setupUI() {
        // Устанавливаем цвет фона
        view.backgroundColor = .white

        // Настройка изображения
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])

        // Настройка имени
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)
        ])

        // Настройка статистики
        statsLabel.font = UIFont.systemFont(ofSize: 16)
        statsLabel.numberOfLines = 0
        statsLabel.textAlignment = .center
        view.addSubview(statsLabel)
        statsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statsLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10)
        ])

        // Настройка кнопки
        randomizeButton.setTitle("Randomize", for: .normal)
        randomizeButton.backgroundColor = .blue
        randomizeButton.setTitleColor(.white, for: .normal)
        randomizeButton.layer.cornerRadius = 10
        randomizeButton.addTarget(self, action: #selector(randomizeTapped), for: .touchUpInside)
        view.addSubview(randomizeButton)
        randomizeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            randomizeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            randomizeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            randomizeButton.widthAnchor.constraint(equalToConstant: 150),
            randomizeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    @objc private func randomizeTapped() {
        print("Randomize button tapped!")
        // Логика для смены супергероя
    }
}
