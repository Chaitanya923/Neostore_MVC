//
//  UITextField.swift
//  Neostore_Chaitanya
//
//  Created by neosoft on 05/05/22.
//

import UIKit

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


extension UITextField{
   @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }

}

extension UITextField {
    func datePicker<T>(target: T,
                       doneAction: Selector,
                       cancelAction: Selector,
                       datePickerMode: UIDatePicker.Mode = .date) {
        let screenWidth = UIScreen.main.bounds.width
        
        func buttonItem(withSystemItemStyle style: UIBarButtonItem.SystemItem) -> UIBarButtonItem {
            let buttonTarget = style == .flexibleSpace ? nil : target
            let action: Selector? = {
                switch style {
                case .cancel:
                    return cancelAction
                case .done:
                    return doneAction
                default:
                    return nil
                }
            }()
            
            let barButtonItem = UIBarButtonItem(barButtonSystemItem: style,
                                                target: buttonTarget,
                                                action: action)
            
            return barButtonItem
        }
        
        let datePicker = UIDatePicker(frame: CGRect(x: 0,
                                                    y: 0,
                                                    width: screenWidth,
                                                    height: 216))
        datePicker.datePickerMode = datePickerMode
        self.inputView = datePicker
        
        let toolBar = UIToolbar(frame: CGRect(x: 0,
                                              y: 0,
                                              width: screenWidth,
                                              height: 44))
        toolBar.setItems([buttonItem(withSystemItemStyle: .cancel),
                          buttonItem(withSystemItemStyle: .flexibleSpace),
                          buttonItem(withSystemItemStyle: .done)],
                         animated: true)
        self.inputAccessoryView = toolBar
    }
}
