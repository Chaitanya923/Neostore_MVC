//
//  ProductDescriptionTableViewCell.swift
//  Neostore_Chaitanya
//
//  Created by neosoft on 31/01/22.
//

import UIKit

class ProductDescriptionTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  3
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideimgCell", for: indexPath) as! SlideimgCollectionViewCell
        cell.img.image = #imageLiteral(resourceName: "cupboardicon")
        return cell
    }
    

    @IBOutlet weak var Cost: UILabel!
    @IBOutlet weak var descriptrion: UILabel!
    @IBOutlet weak var mainimage: UIImageView!
    @IBOutlet weak var imgcollectionview: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imgcollectionview.delegate = self
        imgcollectionview.dataSource = self
        
        imgcollectionview.register(UINib(nibName:"SlideimgCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SlideimgCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
