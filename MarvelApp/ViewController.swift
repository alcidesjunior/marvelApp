//
//  ViewController.swift
//  MarvelApp
//
//  Created by Ada 2018 on 8/23/18.
//  Copyright © 2018 Ada 2018. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    var heroesSearchBar = UISearchController()
    let heroes: [[String: Any]] = [["name":"Iron Man","img":#imageLiteral(resourceName: "iron_man")], ["name":"Captain America","img":#imageLiteral(resourceName: "captain_america")], ["name":"Vision","img": #imageLiteral(resourceName: "vision")]]
    var filterArray = [[]]
    var resultsController = UITableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heroesSearchBar = UISearchController(searchResultsController: resultsController)
        tableView.tableHeaderView = heroesSearchBar.searchBar
        heroesSearchBar.searchResultsUpdater = self
        
        
        tableView.delegate = self
        tableView.dataSource = self
        resultsController.tableView.delegate = self
        resultsController.tableView.dataSource = self
        tableView.rowHeight = 90.0
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 0.343159684, blue: 0.3064972894, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate,UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        for heroe in heroes{
            if heroe["name"] as? String == searchController.searchBar.text!{
                filterArray.removeAll()
                filterArray.append([heroe])
            }
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == resultsController.tableView{
            return filterArray.count
        }else{
            return heroes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "heroeCell", for: indexPath) as? HeroeTableViewCell
        if tableView == resultsController.tableView{
            cell?.heroeName.text = self.filterArray[indexPath.row]["name"] as! String
            cell?.heroeImg.image = self.filterArray[indexPath.row]["img"] as! UIImage
        }else{
            cell?.heroeName.text = self.heroes[indexPath.row]["name"] as? String
            cell?.heroeImg.image = self.heroes[indexPath.row]["img"] as? UIImage
        }
        
        return cell!
    }
    
    
}

