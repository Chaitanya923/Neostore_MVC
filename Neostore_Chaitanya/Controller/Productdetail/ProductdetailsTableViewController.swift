//
//  ProductdetailsTableViewController.swift
//  Neostore_Chaitanya
//
//  Created by Neosoft on 18/01/22.
//

import UIKit

var pro_id : Int = 0

var p_det = ProductDetails(id: 3, productCategoryID: 1, name: "Vishwakarma Solid Table", producer: "Lelo", description: "Vishwakarma Furniture Solid Wood Coffee Table (Finish Color - Dark Black)", cost: 3333, rating: 3, viewCount: 10670, created: "2015-09-07T09:43:15+0000", modified: "2022-02-02T11:17:43+0000", productImages: [ProductImage(id: 4, productID: 3, image: "http://staging.php-dev.in:8844/trainingapp/uploads/prod_img/thumb/medium/3d4007c74793ff2564de15d71.jpeg", created: "2015-09-07T09:43:45+0000", modified: "2015-09-07T09:43:45+0000"), ProductImage(id: 5, productID: 3, image: "http://staging.php-dev.in:8844/trainingapp/uploads/prod_img/thumb/medium/8028d836889749f61c07b22cb.jpeg", created: "2015-09-07T09:44:01+0000", modified: "2015-09-07T09:44:01+0000")])
var p_category = ["","Tables","Chair","Sofas",""]

let stargold = #imageLiteral(resourceName: "star_check")
let starw = #imageLiteral(resourceName: "star_unchek")

class ProductdetailsTableViewController: UITableViewController {
        
    var productQuantityDialog = ProductQuantityDialog()
    
    
    static func loadfromnib(_ pr_id : Int) -> UITableViewController {
        pro_id = pr_id
        return ProductdetailsTableViewController(nibName: "ProductdetailsTableViewController", bundle:nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CallService()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        productQuantityDialog.delegate = self
        
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.register(UINib(nibName: "ProducttitleTableViewCell", bundle: nil), forCellReuseIdentifier: "ProducttitleCell")
        self.tableView.register(UINib(nibName: "ProductDescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductdescCell")
        self.tableView.register(UINib(nibName: "ProductbuybtnTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductbuybtnCell")
        
    }

    //Mark: - API Data Fetching
    func CallService()
    {
        APIServiceDude.shared.getProductDetails (of: pro_id) {
            result in
            switch result {
            case .success(let fetchedProducts):
                
                p_det = fetchedProducts.data
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                print("Error in getting Products: \(error)")
            }
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProducttitleCell", for: indexPath) as! ProducttitleTableViewCell
            cell.name.text = p_det.name
            cell.category.text = "Category - " + p_category[p_det.productCategoryID]
            cell.producer.text = p_det.producer
            
            switch p_det.rating {
            case 1:
                cell.star1.image = stargold
                cell.star2.image = starw
                cell.star3.image = starw
                cell.star4.image = starw
                cell.star5.image = starw
            case 2:
                cell.star1.image = stargold
                cell.star2.image = stargold
                cell.star3.image = starw
                cell.star4.image = starw
                cell.star5.image = starw
            case 3:
                cell.star1.image = stargold
                cell.star2.image = stargold
                cell.star3.image = starw
                cell.star4.image = starw
                cell.star5.image = starw
            case 4:
                cell.star1.image = stargold
                cell.star2.image = stargold
                cell.star3.image = stargold
                cell.star4.image = stargold
                cell.star5.image = starw
            case 5:
                cell.star1.image = stargold
                cell.star2.image = stargold
                cell.star3.image = stargold
                cell.star4.image = stargold
                cell.star5.image = stargold
            default:
                    cell.star1.image = stargold
                    cell.star2.image = stargold
                    cell.star3.image = stargold
                    cell.star4.image = stargold
                    cell.star5.image = stargold
            }
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductdescCell" , for: indexPath) as! ProductDescriptionTableViewCell
            cell.Cost.text = "Rs. " + String(p_det.cost)
            cell.descriptrion.text = p_det.description
            DispatchQueue.global().async {
                // Fetch Image Data
                if let data = try? Data(contentsOf: URL(string: p_det.productImages[0].image)!) {
                    DispatchQueue.main.async {
                        // Create Image and Update Image View
                        cell.mainimage.image = UIImage(data: data)
                        //self.imageView.image = UIImage(data: data)
                    }
                }
            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductbuybtnCell" , for: indexPath) as! ProductbuybtnTableViewCell
            cell.delegate = self
            return cell
        default:
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...

        return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return 80
        case 1:
            return 700
        case 2 :
            return 80
        default:
            return UITableView.automaticDimension
        }
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

extension ProductdetailsTableViewController: ProductQuantityDialogDelegate{
    func tempfunc() {
        print("tempff")
    }
    
    func ontapSubmit(_ p_qty : Int) {
        print(" p = ",p_qty)
    }
    
    func onBgViewTap() {
        debugPrint("Removing... Dialo")
        }
    
}
extension ProductdetailsTableViewController : ProductbuybtnDelegate{
    func ontaprate() {
        let vc = ProductRateDialogueViewController.loadfromnib(pro_id)
        //vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func ontapbuy()  {
        let vc = ProductQuantityDialog.loadFromNib(pro_id)
        //vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
