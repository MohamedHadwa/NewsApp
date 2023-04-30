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
    var filterNews : [Article]?
    let searchController = UISearchController(searchResultsController: nil)

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        homeTabelView.delegate = self
        homeTabelView.dataSource = self
        homeTabelView.register(HomeTableViewCell.nib(), forCellReuseIdentifier: "HomeTableViewCell")
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search in Articles"
        searchController.searchResultsUpdater = self

        getData()
      
    }
    // MARK: - IBActions.
    
    
    // MARK: - Private Functions.
    func getData(){
          let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=c70a81257c66498db733959fc4c3fb09")!
        AF.request(url , method: .get , encoding: JSONEncoding.default).responseDecodable(of: HomeNews.self) { (response) in
            guard let data = response.data else {return}
            let res = try? JSONDecoder().decode(HomeNews.self, from: data)
            self.news = res?.articles ?? [Article()]
            print(res)
        
                self.homeTabelView.reloadData()
            
        }
    }
    
    
}

// MARK: - <#UI.....#> Delegate & DataSource.

extension ViewController :UITableViewDelegate , UITableViewDataSource  ,UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.count ?? 10
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.getData(with:news?[indexPath.row] ?? Article())
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    
    
}

// MARK: - APi.

//extension <#UIviewController#> {
//
//
//
//}



