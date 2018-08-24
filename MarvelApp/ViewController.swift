//
//  ViewController.swift
//  MarvelApp
//
//  Created by Ada 2018 on 8/23/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit
struct Heroes{
    let name: String
    let img: UIImage
}
class ViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    var heroesSearchBar = UISearchController()
    var heroes = [Heroes]()
    var filterArray = [Heroes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.heroes.append(Heroes.init(name: "Iron Man", img: #imageLiteral(resourceName: "iron_man")))
        self.heroes.append(Heroes.init(name: "Captain America", img: #imageLiteral(resourceName: "captain_america")))

        
        heroesSearchBar = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = heroesSearchBar.searchBar
        
        heroesSearchBar.searchResultsUpdater = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 90.0
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 0.343159684, blue: 0.3064972894, alpha: 1)
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate,UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
       
        filterArray = heroes.filter{
            if $0.name.contains(searchController.searchBar.text!) {
                return true
            }else{
                return false
            }
        }
        self.tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filterArray.count > 0{
            return filterArray.count
        }else{
            return heroes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "heroeCell", for: indexPath) as? HeroeTableViewCell
        
        if filterArray.count > 0{
            cell?.heroeName.text = self.filterArray[indexPath.row].name
            cell?.heroeImg.image = self.filterArray[indexPath.row].img
        }else{
            cell?.heroeName.text = self.heroes[indexPath.row].name
            cell?.heroeImg.image = self.heroes[indexPath.row].img
        }
        
        return cell!
    }
    
    
}

