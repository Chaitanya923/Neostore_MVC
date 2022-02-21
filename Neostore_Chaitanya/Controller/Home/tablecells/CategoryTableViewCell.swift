//
//  CategoryTableViewCell.swift
//  Neostore_Chaitanya
//
//  Created by Neosoft on 19/01/22.
//

import UIKit
let imagename2 = [["tableicon","sofaicon"],["chairsicon","cupboardicon"]]

protocol CategoryTableViewCellDelegate {
    func gotoProductlist(_ p : Int)
}

class CategoryTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    var p_category_id = [[1,2],[3,4]]
    var delegatectvc : CategoryTableViewCellDelegate?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideimgCell", for: indexPath) as! SlideimgCollectionViewCell
        cell.img.image = #imageLiteral(resourceName: imagename2[indexPath.section][indexPath.row] )
        return cell
    }
    

    @IBOutlet weak var categorycollectionview: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        categorycollectionview.delegate = self
        categorycollectionview.dataSource = self
        
        categorycollectionview.register(UINib(nibName:"SlideimgCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SlideimgCell")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        let cellWidth = (UIScreen.main.bounds.size.width * 0.5) - 15
        
            return CGSize(width: cellWidth, height: cellWidth)
        }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        //let space = UIScreen.main.bounds.size.width * 0.02
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        //let space = UIScreen.main.bounds.size.width * 0.02
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegatectvc?.gotoProductlist(p_category_id[indexPath.section][indexPath.row])
    }
}
