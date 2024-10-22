//
//  RecipesDetailVC.swift
//  Thynksight_Test
//
//  Created by Ashish Prajapati on 21/10/24.
//

import UIKit

class RecipesDetailVC: UIViewController{
    
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblItemCount: UILabel!
    @IBOutlet weak var viewDivider: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewBtn: UIView!
    
    
    @IBOutlet weak var viewClose: UIView!
    
    @IBOutlet weak var viewFav: UIView!
    
    
    private var selectedRecipe: ModelRecipeList!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        let tableCellViewNib = UINib(nibName: "IngredientCellView", bundle: nil)
        tableView.register(tableCellViewNib, forCellReuseIdentifier: "IngredientCellView_ID")
        
        viewContainer.byRoundingCorners([.topRight, .topLeft], radius: 40)
        viewDivider.customRoundedView(radius: viewDivider.frame.height/2)
        viewBtn.customRoundedView(radius: 12)
        imgFood.loadImageUrl(url: URL(string: selectedRecipe.imgURL)!)
        lblTitle.text = selectedRecipe.title
        lblSubTitle.text = selectedRecipe.subTitle
        lblItemCount.text = "\(selectedRecipe.ingredientName.count) Items"
        
        viewClose.customRoundedView(radius: 6 )
        viewClose.dropShadow(color: .black, offSet: CGSize(width: -2, height: 2), radius: 10, scale: true)
        
        viewFav.customRoundedView(radius: 6 )
        viewFav.dropShadow(color: .black, offSet: CGSize(width: -2, height: 2), radius: 10, scale: true)
    }
    
    
    
    @IBAction func actBtnWatchOnUtube(_ sender: Any) {
        
        UIApplication.shared.open(URL(string: selectedRecipe.uTubeUrl)!)
    }
    
    
    
    @IBAction func actBtnClosse(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    

    func setData(data: ModelRecipeList){
        selectedRecipe = data
    }

}


extension RecipesDetailVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selectedRecipe.ingredientName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCellView_ID") as? IngredientCellView else {
            print("Unable to instantiate IngredientCellView")
            return UITableViewCell()
        }
        
        cell.setData(data: selectedRecipe, atIndex: indexPath.row)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
}
