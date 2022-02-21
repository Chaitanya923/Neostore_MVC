//
//  Productlist.swift
//  Neostore_Chaitanya
//
//  Created by Neosoft on 24/01/22.
//

import Foundation

struct Productlist
{
    var id : Int
    var name : String
    var producer : String
    var cost : Int
    var rating : Int
}
var Productlistarray : [Productlist] = []

func getproduct(_ p_cat_id : Int) -> [Productlist]
{
    getproductapi(p_cat_id)
    print("Productlistarray : \(Productlistarray)")
    return Productlistarray
}

func  getproductapi (_ p_cat_id : Int)  {
 
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    let url_string = "http://staging.php-dev.in:8844/trainingapp/api/products/getList?product_category_id=" + String(p_cat_id)
    
    let url = URL(string: url_string)!
    let task = session.dataTask(with: url) { data, response, error in
        
        // ensure there is no error for this HTTP response
        guard error == nil else {
            print ("error: \(error!)")
            return
        }
        
        // ensure there is data returned from this HTTP response
        guard let content = data else {
            print("No data")
            return
        }
        
        // serialise the data / NSData object into Dictionary [String : Any]
        guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {

            print("Not containing JSON")
            return
        }
 
        //print("gotten json response dictionary is \n \(json["data"])")
        let jsonarray = json["data"] as! [Any]
        for ele in jsonarray
        {
            if let ele = ele as? Dictionary<String,AnyObject>{
                //print(Productlistarray)
                Productlistarray.append(Productlist(id: ele["id"] as! Int, name: ele["name"] as! String, producer: ele["producer"] as! String, cost: ele["cost"] as! Int, rating: ele["rating"] as! Int))
            }
        }
        print(Productlistarray)
    }
    
    // execute the HTTP request
    task.resume()
}
