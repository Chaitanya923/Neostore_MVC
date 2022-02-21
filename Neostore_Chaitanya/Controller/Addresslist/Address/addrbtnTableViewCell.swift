//
//  addrbtnTableViewCell.swift
//  Neostore_Chaitanya
//
//  Created by Neosoft on 16/01/22.
//

import UIKit

class addrbtnTableViewCell: UITableViewCell {

    @IBOutlet weak var placeorder: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        placeorder.layer.cornerRadius = 5
        placeorder.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
