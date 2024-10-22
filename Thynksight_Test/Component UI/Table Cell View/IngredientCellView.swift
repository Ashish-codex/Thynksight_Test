//
//  IngredientCellView.swift
//  Thynksight_Test
//
//  Created by Ashish Prajapati on 22/10/24.
//

import UIKit

class IngredientCellView: UITableViewCell {
    
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewImgContainer: UIView!
    @IBOutlet weak var lblIngredientName: UILabel!
    @IBOutlet weak var lblIngredientGram: UILabel!
    @IBOutlet weak var imgIngredient: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        viewImgContainer.customRoundedView(radius: 6)
        viewContainer.customRoundedView(radius: 10)
        viewContainer.dropShadow(color: .black, opacity: 0.08,  offSet: CGSize(width: -1, height: 1), radius:6, scale: true)
    }
    
    
    func setData(data: ModelRecipeList, atIndex: Int){
        imgIngredient.loadImageUrl(url: URL(string: "\(Constant.ingredientUrl)\(data.ingredientName[atIndex]).png")!)
        
        lblIngredientGram.text  = data.ingredientMeasure[atIndex]
    }
    
}
