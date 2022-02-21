//
//  Textinput.swift
//  Neostore_Chaitanya
//
//  Created by Neosoft on 05/01/22.
//

import UIKit

class Textinput: UITableViewCell {
    
    @IBOutlet weak var userdet: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension UITextField {
    func withImage( image: UIImage ){
        
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.white.cgColor
        self.placeHolderColor = UIColor.white
        
        //let viewBGColor = UIColor.white
            let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
            mainView.layer.cornerRadius = 5

            let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
            //view.backgroundColor = viewBGColor
            mainView.addSubview(view)
            
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: 12.0, y: 10.0, width: 24.0, height: 24.0)
            imageView.tintColor = .white
            view.addSubview(imageView)
            
            
            //let clearImage = UIImage(systemName: "xmark.circle.fill")!
            //self.clearButtonWithImage(clearImage)

            self.leftViewMode = .always
            self.leftView = mainView

        }
}
