//
//  ApiService.swift
//  Thynksight_Test
//
//  Created by Ashish Prajapati on 22/10/24.
//

import Foundation

class ApiService{
    
    
    class func apiCall(url:String) async -> ModelMeals {
        
        var resData = ModelMeals(meals: [])
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        do {
            let (data, urlResponse) = try await URLSession.shared.data(for: request)
            
            let res = try JSONSerialization.jsonObject(with: data, options: [.fragmentsAllowed])
            
            resData = try JSONDecoder().decode(ModelMeals.self, from: data)
            
        } catch let err {
            print("API Error: \(err.localizedDescription)")
        }
        
        return resData
        
    }
}
