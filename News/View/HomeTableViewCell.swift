//
//  HomeTableViewCell.swift
//  News
//
//  Created by Mohamed Hadwa on 30/04/2023.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var authNameLbl: UILabel!
    
    static func nib() ->UINib{
        return UINib(nibName: "HomeTableViewCell", bundle: nil)
    }
    func getData (with data : Article) {
        self.titleLbl.text = data.title
        self.dateLbl.text = data.publishedAt
        self.descriptionLbl.text = data.description
        self.authNameLbl.text = data.author ?? "No Auth"
        guard let imgURL = URL(string: data.urlToImage ?? "" ) else { return  }
         let recource = ImageResource(downloadURL: imgURL)
        self.myImage.kf.setImage(with: recource)

    }
}
