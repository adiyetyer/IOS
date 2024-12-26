//
//  LaunchScreenViewController.swift
//  ABT_App
//
//  Created by Adiet Erlanuly on 27.12.2024.
//


import UIKit

class LaunchScreenViewController: UIViewController {

    @IBOutlet weak var launchImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Настройка изображения
        launchImageView.image = UIImage(named: "6195926.jpeg")
    }
}
