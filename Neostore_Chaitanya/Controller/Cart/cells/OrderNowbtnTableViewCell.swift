//
//  OrderNowbtnTableViewCell.swift
//  Neostore_Chaitanya
//
//  Created by neosoft on 30/01/22.
//

import UIKit

protocol OrderNowDelegate {
    func ontapOrder()
}

class OrderNowbtnTableViewCell: UITableViewCell {

    var ondelegate :OrderNowDelegate?
    
    @IBOutlet weak var Ordernowbtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Ordernowbtn.layer.cornerRadius = 7
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func OrderNow(_ sender: UIButton) {
        ondelegate?.ontapOrder()
    }
}
