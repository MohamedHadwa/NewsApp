//
//  DetailsViewController.swift
//  News
//
//  Created by Mohamed Hadwa on 03/05/2023.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {

    // MARK: - IBOutlets.
    
    @IBOutlet weak var auhorLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var discreptionLbl: UILabel!
    @IBOutlet weak var newsLinkbtn: UIButton!
    
    // MARK: - Private Variables.
    var newsDetailes : Article?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        displayDetailesInView()
    }
    // MARK: - IBActions.
    
    @IBAction func newsLinkPressedBtn(_ sender: Any) {
    }
    
    // MARK: - Private Functions.
    func displayDetailesInView (){
        self.title = newsDetailes?.title
        self.auhorLbl.text = newsDetailes?.author
        self.dateLbl.text = newsDetailes?.publishedAt
        self.discreptionLbl.text = newsDetailes?.description
        guard let imgURL = URL(string: newsDetailes?.urlToImage ?? "" ) else { return  }
         let recource = ImageResource(downloadURL: imgURL)
        self.newsImage.kf.setImage(with: recource)
        newsLinkbtn.setTitle(newsDetailes?.url, for: .normal)
        
    }
    
    
}

// MARK: - <#UI.....#> Delegate & DataSource.

//extension <#UIviewController#> {
//
//
//}
//
//// MARK: - APi.
//
//extension <#UIviewController#> {
//
//
//
//}


