//
//  Ext.swift
//  Thynksight_Test
//
//  Created by Ashish Prajapati on 21/10/24.
//

import Foundation
import UIKit

extension UIView{
    

    func customRoundedView(
        radius: CGFloat = 10.0,
        borderColor: CGColor? = UIColor.clear.cgColor,
        borderWidth: CGFloat = 0.0){
        
            clipsToBounds = true
            layer.cornerRadius = radius
            layer.borderColor = borderColor
            layer.borderWidth = borderWidth
            
    }
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
      layer.masksToBounds = false
      layer.shadowColor = color.cgColor
      layer.shadowOpacity = opacity
      layer.shadowOffset = offSet
      layer.shadowRadius = radius
    }
    
    
    func byRoundingCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }
    
}


extension UIImageView{
    
    func circularImage(radius: CGFloat){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
//        self.layer.masksToBounds = false
    }
    
    func setImageColor(color: UIColor){
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
    
    
    func loadImageUrl(url: URL) {
      DispatchQueue.global().async { [weak self] in
          if let data = try? Data(contentsOf: url, options: .uncached) {
              if let image = UIImage(data: data) {
                  DispatchQueue.main.async {
                      self?.image = image
                  }
              }
          }
          else{
              print("Image Error: Failed to load image")
              DispatchQueue.main.async {
                  self?.image = UIImage(named: "img_photo_placeholder")
              }
              
          }
       }
     }
     
    
}
