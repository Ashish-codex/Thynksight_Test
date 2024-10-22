//
//  SingleCollectionCell.swift
//  Thynksight_Test
//
//  Created by Ashish Prajapati on 21/10/24.
//

import UIKit

class SingleCollectionCell: UICollectionViewCell {
    
    
    @IBOutlet weak private var imgIngredient: UIImageView!
    
    @IBOutlet weak private var lblIngredient: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    
    public func setData(ingredientName: String) {
        imgIngredient.loadImageUrl(url: URL(string: "\(Constant.ingredientUrl)\(ingredientName).png")!)
//            .image = UIImage(named: "\(ingredientName)")
        lblIngredient.text = "\(ingredientName)"
    }
    

}
