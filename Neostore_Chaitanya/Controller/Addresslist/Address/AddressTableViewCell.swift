//
//  AddressTableViewCell.swift
//  Neostore_Chaitanya
//
//  Created by Neosoft on 16/01/22.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    @IBOutlet weak var addressdet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func Selectaddr(_ sender: UIButton) {
        
    }
    
}
