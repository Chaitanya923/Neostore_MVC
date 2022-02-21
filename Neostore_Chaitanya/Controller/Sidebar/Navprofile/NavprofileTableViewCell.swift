//
//  NavprofileTableViewCell.swift
//  Neostore_Chaitanya
//
//  Created by Neosoft on 14/01/22.
//

import UIKit

class NavprofileTableViewCell: UITableViewCell {

    @IBOutlet weak var dp: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        dp.makeRounded()
        dp.layer.borderWidth = 5
        dp.layer.borderColor = CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 1)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
