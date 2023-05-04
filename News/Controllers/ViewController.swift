//
//  ViewController.swift
//  News
//
//  Created by Mohamed Hadwa on 30/04/2023.
//

import UIKit
import Alamofire


class ViewController: UIViewController {


    
    // MARK: - IBOutlets.
    
    @IBOutlet weak var homeTabelView: UITableView!
    
    // MARK: - Private Variables.
    var news : [Article]?
    var filterNews : [Article] = []
    let searchController = UISearchController(searchResultsController: nil)

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        homeTabelView.delegate = self
        homeTabelView.dataSource = self
        homeTabelView.register(HomeTableViewCell.nib(), forCellReuseIdentifier: "HomeTableViewCell")
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.placeholder = "Search in Articles"
        searchController.searchResultsUpdater = self
        self.homeTabelView.rowHeight = UITableView.automaticDimension
        self.homeTabelView.estimatedRowHeight = 500
        getData()
       
      
    }
    // MARK: - IBActions.
    
    
    // MARK: - Private Functions.
    func getData(){
          let url = URL(string: "https://newsapi.org/v2/everything?q=everything&apiKey=c70a81257c66498db733959fc4c3fb09")!
        AF.request(url , method: .get , encoding: JSONEncoding.default).responseDecodable(of: HomeNews.self) { (response) in
            guard let data = response.data else {return}
            let res = try? JSONDecoder().decode(HomeNews.self, from: data)
            self.news = res?.articles ?? [Article()]
        
                self.homeTabelView.reloadData()
            
        }
    }
    
    
}

// MARK: - ViewController Delegate & DataSource.

extension ViewController :UITableViewDelegate , UITableViewDataSource  ,UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterNews = news?.filter({ (new) ->Bool in
            return new.title? .lowercased().contains(searchController.searchBar.text!.lowercased()) ?? true
        }) ?? [Article()]
        homeTabelView.reloadData()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.isActive ? filterNews.count : news?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.getData(with: searchController.isActive ? filterNews[indexPath.row] : news?[indexPath.row] ?? Article())
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return homeTabelView.estimatedRowHeight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "details") as! DetailsViewController

        vc.newsDetailes = searchController.isActive ? filterNews[indexPath.row] : news?[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
                let faviorateAction = UIContextualAction(style: .destructive, title: "Fav") { _, _, _ in
                   print ("this user is Fav \(self.news?[indexPath.row])")
              

                }
                return UISwipeActionsConfiguration(actions: [ faviorateAction])
        
        
     
        
        
    }
    
}

// MARK: - APi.

//extension <#UIviewController#> {
//
//
//
//}



