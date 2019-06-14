//
//  main.swift
//  Day14JuneReadingJsonFiles
//
//  Created by MacStudent on 2019-06-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation

func readJsonFile(jsonFileName: String)
{
    let url = Bundle.main.url(forResource: jsonFileName, withExtension: "json")
    
    // part of error handling
    guard let jsonData = url else { return }
    guard let data = try? Data(contentsOf: jsonData) else {return}
    guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {return}
    
    print(json)
    
    if let jsonDictionary = json as? [String: Any]{
        if let email = jsonDictionary["email"] as? String
        {
            print(email)

        }
      
        
        if let addDictionary = jsonDictionary["address"] as? Dictionary<String, Any>
        {
            if let city = addDictionary["city"] as? String{
                print(city)

            }
         
        }
        //read Geo dictionary
        if let addressDictionary = jsonDictionary["address"] as? Dictionary<String, Any>
        {
            if let geoDictionary = addressDictionary["geo"] as? Dictionary<String, Any>{
               
                if let lat = geoDictionary["lat"] as? String{
                    print(lat)
                }
                
                if let long = geoDictionary["lng"] as? String{
                    print(long)
                }
                
            }
            
        }
        
    }
}

readJsonFile(jsonFileName: "Users")
