//
//  ProductListViewController.swift
//  Neostore_Chaitanya
//
//  Created by neosoft on 22/02/22.
//

import UIKit

class ProductListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ProductListingTableView: UITableView!
    
    var pro_list :[ProductModel] = []
    var cat_id :  Int = 0
    var p_category_id = [0,1,3,2,4]
    var p_category = ["","Tables","Chair","Sofas",""]
    let stargold = #imageLiteral(resourceName: "star_check")
    let starw = #imageLiteral(resourceName: "star_unchek")
    static func loadfromnib(_ id : Int) -> UIViewController {
        let vc = ProductListViewController(nibName: "ProductListViewController", bundle:nil)
        vc.cat_id = vc.p_category_id[id]
     return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CallService()
        self.showSpinner(onView: self.view)
        
        ProductListingTableView.delegate = self
        ProductListingTableView.dataSource = self
        
        ProductListingTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        ProductListingTableView.register(UINib(nibName: "ProductlistcellTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductlistCell")
        
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.backgroundColor = UIColor(hexFromString: "E91C1A")
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.isOpaque = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white,NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 25)] //,NSAttributedString.Key.font: UIFont(name: "GOTHAM", size: 14)]
        self.title = p_category[cat_id]
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(imageLiteralResourceName: "search_icon"))
        
        // Do any additional setup after loading the view.
    }


    func  CallService() {
        APIServiceDude.shared.getProductList(of: cat_id) {
            result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedProducts):
                    var i = 0
                    for ele in fetchedProducts.data {
                        self.pro_list.append(ele)
                        print("ele ",i," :",ele)
                        i=i+1
                    }
                    //print("Array",self.pro_list)
                    
                    self.ProductListingTableView.reloadData()
                    self.removeSpinner()
                    
                case .failure(let error):
                    print("Error in getting Products: \(error)")
                }
            }
            
        }
        //print(ProductModel.self)
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pro_list.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("CELL",indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductlistCell", for: indexPath) as! ProductlistcellTableViewCell
        cell.Product_name.text = pro_list[indexPath.row].name
        cell.Product_Price.text = "Rs. " + String( pro_list[indexPath.row].cost)
        cell.Product_center.text = pro_list[indexPath.row].producer

            DispatchQueue.global().async {
                // Fetch Image Data
                if let data = try? Data(contentsOf: URL(string: self.pro_list[indexPath.row].productImages)!) {
                    DispatchQueue.main.async {
                        // Create Image and Update Image View
                        cell.Product_img.image = UIImage(data: data)
                        //self.imageView.image = UIImage(data: data)
                    }
                }
            }
        switch pro_list[indexPath.row].rating {
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
        // Configure the cell...

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print()
        self.navigationController?.pushViewController(ProductDetailsViewController.loadfromnib(pro_list[indexPath.row].id), animated: true)
    }
    
}


var vSpinner : UIView?

extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}



