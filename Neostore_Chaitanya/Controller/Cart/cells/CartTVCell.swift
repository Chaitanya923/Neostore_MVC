//
//  CartTVCell.swift
//  NeoSTORE
//
//  Created by Neosoft on 16/12/21.
//

import UIKit

protocol  CartEditButtonDelegate {
    func didTapEditBtn(id: Int)
}
class CartTVCell: UITableViewCell {
    
    static let cellIdentifier = "cartTVCell"
    var id = 0
    var delegate: CartEditButtonDelegate?
    @IBOutlet weak var Producttitle: UILabel!
    @IBOutlet weak var Category: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var qty: UILabel!
    @IBOutlet weak var cartimg: UIImageView!
    
    static func loadFromNib() -> UINib {
        UINib(nibName: "CartTVCell", bundle: nil)
    }

    @IBOutlet weak var qtyView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        qtyView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
