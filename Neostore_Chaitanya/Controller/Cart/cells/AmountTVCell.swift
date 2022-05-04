//
//  AmountTVCell.swift
//  NeoSTORE
//
//  Created by Neosoft on 16/12/21.
//

import UIKit

class AmountTVCell: UITableViewCell {
    
    static let cellIdentifier = "amountTVCell"
    
    @IBOutlet weak var totalcosting: UILabel!
    
    static func loadFromNib() -> UINib {
        UINib(nibName: "AmountTVCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
