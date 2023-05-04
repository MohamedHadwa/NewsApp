//
//  HeadlineViewController.swift
//  News
//
//  Created by Mohamed Hadwa on 30/04/2023.
//

import UIKit

class HeadlineViewController: UIViewController {

    // MARK: - IBOutlets.
    
    @IBOutlet weak var favTableView: UITableView!
    
    // MARK: - Private Variables.
    var fav  : [Article]?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        favTableView.register(HomeTableViewCell.nib(), forCellReuseIdentifier: "HomeTableViewCell")
        favTableView.dataSource = self
        favTableView.delegate = self

    }
    // MARK: - IBActions.
    
    
    // MARK: - Private Functions.
    
    
    
}

// MARK: - <#UI.....#> Delegate & DataSource.

extension HeadlineViewController :UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.getData(with: fav?[indexPath.row] ?? Article())
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fav?.count ?? 1
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
        
    
}
//
//// MARK: - APi.
//
//extension <#UIviewController#> {
//    
//    
//    
//}


