//
//  DataManager.swift
//  SimpleJSONAP
//
//  Created by Andrea Perez on 3/4/19.
//  Copyright © 2019 Andrea Perez. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
        let MYJSONURL = "https://api.myjson.com/bins/r67mu"
    
        var dataArray = ["No data yet"]
    
    func getData(completion: @escaping (_ success:Bool) ->())
    {
        
        var success = true
            
        let actualUrl = URL(string: MYJSONURL)
    
    
        let task = URLSession.shared.dataTask(with: actualUrl!) {(data, response, error) in
           if let _ = data, error == nil {
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                if let veggieArray  = jsonObj!.value(forKey: "characters") as? Array<String> {
                    self.dataArray = veggieArray
                    
                    print(jsonObj!.value(forKey: "characters")!)
                }
            }
        } else{
            success = false
        }
         completion(success)
    }
        task.resume()
    }

}
