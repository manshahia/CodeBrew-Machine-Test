//
//  DataService.swift
//  Property-job-test
//
//  Created by Ravi Inder Manshahia on 17/06/19.
//  Copyright © 2019 Ravi Inder Manshahia. All rights reserved.
//

import Foundation

class DataService {
    
    static let instance = DataService()
    
    
    
    func fetchData(with url: String, completion: @escaping Completion_Handler) {
    
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: [])
                
                guard let jsonDict = jsonResponse as? [String:Any] else { return }
                guard let dataDict = jsonDict["data"] as? [String:Any] else { return }
                guard let recommendedArray = dataDict["recommended"] as? [[String:Any]] else { return }

                
                completion(true,recommendedArray)
                
                }
             catch {
                print("JSON error: \(error.localizedDescription)")
            }
            
        })
        
        task.resume()
    }
}
