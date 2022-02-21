//
//  ProductQuantityDialog.swift
//  NeoSTORE
//
//  Created by Neosoft on 17/12/21.
//

import UIKit

protocol ProductQuantityDialogDelegate{
    func onBgViewTap()
    func onsubmit(p_qty : Int)
}

class ProductQuantityDialog: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var submitBtn: UIButton!
    
    var pqddelegate: ProductQuantityDialogDelegate?
    var delegate : ProductQuantityDialogDelegate?
    
    static func loadFromNib() -> ProductQuantityDialog {
        ProductQuantityDialog(nibName: "ProductQuantityDialog", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgView.isOpaque = true
        alertView.layer.cornerRadius = 10
        submitBtn.layer.cornerRadius = 7
        bgView.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(onBgViewTap)))
    }
    @IBAction func submitBtnTap(_ sender: UIButton) {
        print("BG View Tapped")
        pqddelegate?.onsubmit(p_qty : 1)
        }
         
    @objc func onBgViewTap(){
        print("BG View Tapped")
        pqddelegate?.onBgViewTap()
        self.dismiss(animated: true, completion: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
