//
//  CartTableViewController.swift
//  Neostore_Chaitanya
//
//  Created by neosoft on 28/01/22.
//

import UIKit

class CartTableViewController: UITableViewController {
    
    var cartproducts : [CartProduct] = []
    var cartrespo: CartResponse?
    var total : Int = 0
    static func loadFromNib() -> CartTableViewController {
        CartTableViewController(nibName: "CartTableViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CallService()
        self.navigationController?.navigationBar.isHidden = false
        self.title = "My Cart"
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.register(UINib(nibName: "CartTVCell", bundle: nil), forCellReuseIdentifier: "cartTVCell")
        self.tableView.register(UINib(nibName: "AmountTVCell", bundle: nil), forCellReuseIdentifier: "amountTVCell")
        self.tableView.register(UINib(nibName: "OrderNowbtnTableViewCell", bundle: nil), forCellReuseIdentifier: "orderTVCell")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func CallService() {
        APIServiceDude.shared.getMyCartDetails(accessToken: KeychainManagement().getAccessToken()) { result in
            
            DispatchQueue.main.async { [self] in
                switch result{
                case .success(let resps):
                    cartrespo = resps
                    cartproducts = resps.data
                    total = Int(resps.total)
                    tableView.reloadData()
                case .failure(_):
                    print("error")
                }
            }
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 110
        case 1:
            return 90
        case 2:
            return 80
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return cartproducts.count
        case 1:
            return 1
        case 2:
            return 1
        default:
            return 0
        }
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cartTVCell", for: indexPath) as! CartTVCell
            cell.Producttitle.text = cartproducts[indexPath.row].product.name
            cell.Category.text = cartproducts[indexPath.row].product.productCategory
            cell.cost.text = "Rs "+String(cartproducts[indexPath.row].product.cost)
            cell.qty.text = String(cartproducts[indexPath.row].quantity)
            DispatchQueue.global().async {
                // Fetch Image Data
                if let data = try? Data(contentsOf: URL(string: self.cartproducts[indexPath.row].product.productImages)!) {
                    DispatchQueue.main.async {
                        // Create Image and Update Image View
                        cell.cartimg.image = UIImage(data: data)
                        //self.imageView.image = UIImage(data: data)
                    }
                }
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "amountTVCell", for: indexPath) as! AmountTVCell
            cell.totalcosting.text = "Rs " + String(total)
            //cell.totalcosting.text = String(cartrespo?.total)
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "orderTVCell", for: indexPath) as! OrderNowbtnTableViewCell
            cell.ondelegate = self
            return cell
            
        default:
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...

        return cell
        }
    }

    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.section == 0 {
            let deleteAction = UIContextualAction(style: .normal, title: "Delete") { (action, view, completion) in
                
                completion(true)
            }
            
            
            let img = UIImage(systemName: "trash.circle.fill")!.withTintColor(.systemRed, renderingMode: .automatic)
            deleteAction.image = img
            deleteAction.backgroundColor = .systemRed
            return UISwipeActionsConfiguration(actions: [deleteAction])
        }
        return nil
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}

extension CartTableViewController : OrderNowDelegate {
    func ontapOrder() {
        //self.navigationController?.pushViewController(AddresslistTableViewController.loadfromnib(), animated: true)
        self.navigationController?.pushViewController(AddaddressViewController(), animated: true)
    }
    
    
}
