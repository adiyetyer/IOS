//
//  DetailsViewController.swift
//  FavoriteListApp
//
//  Created by Adiet Erlanuly on 08.11.2024.
//


import UIKit

class DetailsViewController: UIViewController {
    var item: FavoriteItem?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var reasonLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = item?.title
        reasonLabel.text = item?.reason
        descriptionLabel.text = item?.description
        
        if let imageName = item?.imageName, let image = UIImage(named: imageName) {
            imageView.image = image
        }
    }
}
