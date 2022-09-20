//
//  TableViewCell.swift
//  takeHomeTest
//
//  Created by Hannatassja Hardjadinata on 19/09/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    var product: Product? {
        didSet{
            self.setData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(){
        if let product = self.product {
            self.priceLabel.text = "\(product.price)"
            self.titleLabel.text = product.title
            self.descriptionLabel.text = product.description
            self.ratingLabel.text = "★" + "\(product.rating.rate)"
            
            guard let imageURL = URL(string: "\(product.image)") else {
                fatalError("image not found")
            }
            self.productImageView.clipsToBounds = true
            self.productImageView.contentMode = .scaleAspectFit
            self.productImageView.load(url: imageURL)
        }
    }
    
}
