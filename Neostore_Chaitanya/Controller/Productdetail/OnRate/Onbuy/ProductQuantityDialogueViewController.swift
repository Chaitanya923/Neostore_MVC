//
//  ProductQuantityDialogueViewController.swift
//  Neostore_Chaitanya
//
//  Created by neosoft on 07/02/22.
//

import UIKit

protocol ProductQuantityDelegate {
    func Taponbgview()
    func Taponsubmit()
}

class ProductQuantityDialogueViewController: UIViewController {

    @IBOutlet weak var BgView : UIView!
    @IBOutlet weak var AlertView : UIView!
    @IBOutlet weak var ProductName : UILabel!
    @IBOutlet weak var ProductImg :UIImageView!
    @IBOutlet weak var Quantity : UITextField!
    @IBOutlet weak var SubmitBtn : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
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
