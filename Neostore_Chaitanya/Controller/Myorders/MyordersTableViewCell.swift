//
//  MyordersTableViewCell.swift
//  Neostore_Chaitanya
//
//  Created by Neosoft on 07/01/22.
//

import UIKit

class MyordersTableViewCell: UITableViewCell {
    @IBOutlet weak var orderid: UILabel!
    @IBOutlet weak var orderdate: UILabel!
    @IBOutlet weak var cost: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
