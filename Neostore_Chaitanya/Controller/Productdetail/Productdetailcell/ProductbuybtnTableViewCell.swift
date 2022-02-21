//
//  ProductbuybtnTableViewCell.swift
//  Neostore_Chaitanya
//
//  Created by Neosoft on 19/01/22.
//

import UIKit

protocol ProductbuybtnDelegate{
    func ontapbuy()
    func ontaprate()
}

class ProductbuybtnTableViewCell: UITableViewCell {
    @IBOutlet weak var buynow: UIButton!
    @IBOutlet weak var rate: UIButton!
    
    var delegate : ProductbuybtnDelegate?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        buynow.layer.cornerRadius = 5
        rate.layer.cornerRadius = 5
        self.selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func ontapbuybtn(_ sender: UIButton) {
        delegate?.ontapbuy()
    }
    @IBAction func ontapratebtn(_ sender: UIButton) {
        delegate?.ontaprate()
    }
}
