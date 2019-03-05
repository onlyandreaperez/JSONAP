//
//  DataManager.swift
//  SimpleJSONAP
//
//  Created by Andrea Perez on 3/4/19.
//  Copyright © 2019 Andrea Perez. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
        func getData(){
            
        let urlString = "https://api.myjson.com/bins/136w0u"
            
        let actualUrl = URL(string: urlString)
        
        let session = URLSession.shared
    
        let task = session.dataTask(with: actualUrl!) {(data, response, error) in
            if error != nil{
                //handle the error
            }
            if let successfulData = data {
                print(String(data: successfulData, encoding: String.Encoding.ascii))
            }
    }
            task.resume()
}

}
