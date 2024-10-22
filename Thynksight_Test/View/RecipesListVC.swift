//
//  ViewController.swift
//  Thynksight_Test
//
//  Created by Ashish Prajapati on 21/10/24.
//

import UIKit



class RecipesListVC: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var arrRecipeData: [ModelRecipeList] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let tableCellViewNib = UINib(nibName: "RecipeCellView", bundle: nil)
        tableView.register(tableCellViewNib, forCellReuseIdentifier: "RecipeCellView_ID")
        
//        arrRecipeData = [
//            
//            ModelRecipeList(imgURL: "main_food", title: "Healthy Taco Salad with fresh vegetable", subTitle: "This Healthy Taco Salad is the universal delight of taco night", ingredientName: ["Garlic", "Pepper", "Vinegar", "Garlic", "Pepper", "Vinegar"]),
//            
//            ModelRecipeList(imgURL: "main_food", title: "Healthy Taco Salad with fresh vegetable", subTitle: "This Healthy Taco Salad is the universal delight of taco night", ingredientName: ["Garlic", "Pepper", "Vinegar"]),
//            
//            ModelRecipeList(imgURL: "main_food", title: "Healthy Taco Salad with fresh vegetable", subTitle: "This Healthy Taco Salad is the universal delight of taco night", ingredientName: ["Garlic", "Pepper", "Vinegar"]),
//            
//            ModelRecipeList(imgURL: "main_food", title: "Healthy Taco Salad with fresh vegetable", subTitle: "This Healthy Taco Salad is the universal delight of taco night", ingredientName: ["Garlic", "Pepper", "Vinegar"]),
//            
//            ModelRecipeList(imgURL: "main_food", title: "Healthy Taco Salad with fresh vegetable", subTitle: "This Healthy Taco Salad is the universal delight of taco night", ingredientName: ["Garlic", "Pepper", "Vinegar"])
//    
//        ]
        
        
        
        Task {
            await apiGetRecipeData()
        }
        
        
    }
    
    
    
    func showLoading(isLoading:Bool) {
        if(isLoading){
            tableView.isHidden = true
            loadingIndicator.isHidden = false
            loadingIndicator.startAnimating()
        }else{
            tableView.isHidden = false
            loadingIndicator.isHidden = true
            loadingIndicator.stopAnimating()
        }
    }
    
    
    func apiGetRecipeData() async {
        
        showLoading(isLoading: true)
        let recipeData = await ApiService.apiCall(url: Constant.baseUrl)
        

        for item in recipeData.meals {
            arrRecipeData.append(ModelRecipeList(
                imgURL: item.strMealThumb ?? "",
                title: item.strMeal ?? "-",
                subTitle: item.strInstructions ?? "-",
                uTubeUrl: item.strYoutube ?? "",
                ingredientName: [
                    item.strIngredient1 ?? "",
                    item.strIngredient2 ?? "",
                    item.strIngredient3 ?? "",
                    item.strIngredient4 ?? "",
                    item.strIngredient5 ?? "",
                    item.strIngredient6 ?? "",
                    item.strIngredient7 ?? "",
                    item.strIngredient8 ?? "",
                    item.strIngredient9 ?? "",
                    item.strIngredient10 ?? "",
                ],
                ingredientMeasure: [
                    item.strMeasure1 ?? "",
                    item.strMeasure2 ?? "",
                    item.strMeasure3 ?? "",
                    item.strMeasure4 ?? "",
                    item.strMeasure5 ?? "",
                    item.strMeasure6 ?? "",
                    item.strMeasure7 ?? "",
                    item.strMeasure8 ?? "",
                    item.strMeasure9 ?? "",
                    item.strMeasure10 ?? "",
                ])
            )
        }
        
        showLoading(isLoading: false)
        tableView.reloadData()
        
    }


}



extension RecipesListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrRecipeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCellView_ID") as? RecipeCellView else{
            print("Unable to cast RecipesCellView ")
            return UITableViewCell()
        }
        
        cell.setData(data: ModelRecipeList(
            imgURL: arrRecipeData[indexPath.row].imgURL,
            title: arrRecipeData[indexPath.row].title,
            subTitle: arrRecipeData[indexPath.row].subTitle,
            uTubeUrl: arrRecipeData[indexPath.row].uTubeUrl,
            ingredientName: arrRecipeData[indexPath.row].ingredientName, ingredientMeasure: arrRecipeData[indexPath.row].ingredientMeasure)
        )
        
        cell.selectionStyle = .none
        
        
        return cell
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 420
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "RecipesDetailVC_ID") as? RecipesDetailVC else {
            print("Unable to instantiate RecipesDetailVC")
            return
        }
        
        navigationController?.pushViewController(vc, animated: true)
        vc.setData(data: arrRecipeData[indexPath.row])
    }
    
}

