import UIKit

struct UIHelpers {
    static func createGradientLayer(colors: [CGColor], frame: CGRect) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = frame
        return gradientLayer
    }
}

private func setupUI() {
    let gradientLayer = UIHelpers.createGradientLayer(
        colors: [UIColor.systemBlue.cgColor, UIColor.systemTeal.cgColor],
        frame: view.bounds
    )
    view.layer.insertSublayer(gradientLayer, at: 0)

    // Остальная настройка UI
    ...
}


