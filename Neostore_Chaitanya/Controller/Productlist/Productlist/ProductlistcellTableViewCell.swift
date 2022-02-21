//
//  ProductlistcellTableViewCell.swift
//  Neostore_Chaitanya
//
//  Created by Neosoft on 13/01/22.
//

import UIKit

class ProductlistcellTableViewCell: UITableViewCell {

    @IBOutlet weak var Product_img: UIImageView!
    @IBOutlet weak var Product_name: UILabel!
    @IBOutlet weak var Product_center: UILabel!
    @IBOutlet weak var Product_Price: UILabel!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
