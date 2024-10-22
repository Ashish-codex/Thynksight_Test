//
//  RecipeCellView.swift
//  Thynksight_Test
//
//  Created by Ashish Prajapati on 21/10/24.
//

import UIKit

class RecipeCellView: UITableViewCell {
    
    
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var viewFav: UIView!
    
    @IBOutlet weak var imgFav: UIImageView!
    
    @IBOutlet weak var viewContainer: UIView!
    
    
    var arrIngredients:[String] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let collectionCellViewNib = UINib(nibName: "SingleCollectionCell", bundle: nil)
        collectionView.register(collectionCellViewNib, forCellWithReuseIdentifier: "SingleCollectionCell_ID")
        
        
        imgFood.circularImage(radius: 10)
        viewContainer.customRoundedView(radius: 10)
        viewContainer.dropShadow(color: .black, opacity: 0.1, offSet: CGSize(width: -2, height: 2), radius: 16, scale: true)
        
        viewFav.customRoundedView(radius: 6 )
        viewFav.dropShadow(color: .black, offSet: CGSize(width: -2, height: 2), radius: 10, scale: true)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    @IBAction func actBtnFav(_ sender: Any) {
    }
    
    
    
    
    func setData(data: ModelRecipeList){
        imgFood.loadImageUrl(url: URL(string: data.imgURL)!)
//            .image = UIImage(named: data.imgURL)
        lblTitle.text = data.title
        lblSubTitle.text = data.subTitle
        arrIngredients = data.ingredientName
    }
    
    
}




extension RecipeCellView:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrIngredients.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SingleCollectionCell_ID", for: indexPath) as? SingleCollectionCell else {
            print("Unable to cast SingleCollectionCell")
            return UICollectionViewCell()
        }
        
        cell.setData(ingredientName: arrIngredients[indexPath.row])
        
        return cell
    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }

}
    
