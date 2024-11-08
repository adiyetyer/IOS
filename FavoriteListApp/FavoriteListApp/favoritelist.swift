//
//  favoritelist.swift
//  FavoriteListApp
//
//  Created by Adiet Erlanuly on 08.11.2024.
//

import UIKit

struct FavoriteItem {
    let title: String
    let reason: String
    let description: String
    let imageName: String
}

class favoritelist: UITableViewController {
    var items = [
        FavoriteItem(title: "Sopranos", reason: "атмосфера", description: "Serial.", imageName: "sopranos.jpg"),
        FavoriteItem(title: "One Piece", reason: "призыв к свободе", description: "Эпическое аниме про пиратов и дружбу.", imageName: "onepiece.jpg"),
        FavoriteItem(title: "LA PATRULLA by Peso Pluma", reason: "Завораживающий звук", description: "Песня.", imageName: "lapatrulla.jpg"),
        FavoriteItem(title: "Iron Man 3", reason: "Любимый фильм детства", description: "Фильм", imageName: "ironman3.jpg"),
        FavoriteItem(title: "Nauryz Kozhe", reason: "Очень вкусно и сытно", description: "Традиционное казахское блюдо", imageName: "nauryzkozhe.jpg"),
        FavoriteItem(title: "Barca 2014-2015", reason: "Лучший футбольный сезон", description: "best team", imageName: "barcelona2015.jpg"),
        FavoriteItem(title: "Messi", reason: "best", description: "батя роналду", imageName: "messi.jpg"),
        FavoriteItem(title: "Winning Boxing Gloves", reason: "Удобные перчатки", description: "Перчатки.", imageName: "boxinggloves.jpg"),
        FavoriteItem(title: "m3 touring", reason: "красиво,быстро и практично", description: "Автомобиль.", imageName: "m3touring.jpg"),
        FavoriteItem(title: "onitsuka tiger", reason: "красивые", description: "Кроссовки.", imageName: "onitsukatiger.jpg")
    ]
    
    // Инициализируем favoriteItems как пустой массив
    var favoriteItems: [Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
    
    
    // Инициализируем favoriteItems с правильной длиной
    favoriteItems = Array(repeating: false, count: items.count)
   }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showOnlyFavorites {
            return favoriteItems.filter { $0 }.count
        }
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)

        var displayedItems = items
        if showOnlyFavorites {
            displayedItems = items.enumerated().filter { favoriteItems[$0.offset] }.map { $0.element }
        }

        let item = displayedItems[indexPath.row]
        cell.textLabel?.text = item.title

        if favoriteItems[indexPath.row] {
            cell.backgroundColor = UIColor.lightGray
            cell.accessoryView = UIImageView(image: UIImage(systemName: "star.fill"))
        } else {
            cell.backgroundColor = UIColor.white
            cell.accessoryView = UIImageView(image: UIImage(systemName: "star"))
        }

        return cell
    }


   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetails",
           let detailsVC = segue.destination as? DetailsViewController,
           let selectedIndex = tableView.indexPathForSelectedRow {
            
            let item = items[selectedIndex.row]
            detailsVC.item = item
        }
    }
    
 
    
    @IBAction func favoriteButton(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) {
            favoriteItems[indexPath.row].toggle()
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    var showOnlyFavorites = false

    @IBAction func toggleFavorites(_ sender: UIBarButtonItem) {
        showOnlyFavorites.toggle() // Переключаем состояние фильтрации
        sender.title = showOnlyFavorites ? "Show All" : "Show Favorites" // Меняем текст кнопки
        tableView.reloadData()
    }

    
}
