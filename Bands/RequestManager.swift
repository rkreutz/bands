//
//  RequestManager.swift
//  Bands
//
//  Created by Rodrigo Kreutz on 21/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import Foundation
import Alamofire

struct RequestManager {
    
    static func fetchBandDetails(id: String, completion: @escaping ((_ band: Band?, _ errorMsg: String?) -> Void) ) {
        let url = "https://powerful-oasis-33182.herokuapp.com/bands/".stringByAppendingPathComponent(pathComponent: id)
        
        Alamofire.request(url).responseJSON { response in
            var band: Band?
            var errorMsg: String?
            
            // Checks for any errors and the data that was fetched
            switch response.result {
            case .failure(let err):
                errorMsg = err.localizedDescription
            case .success(let result):
                guard var result = result as? [String: String] else {
                    errorMsg = "Alguma coisa deu errado ao tentar carregar lista de tarefas."
                    break
                }
                result["id"] = id
                
                band = Band(dict: result)
            }
            
            // After the webservice is finished we can call the completion handler
            completion(band, errorMsg)
        }
    }
    
}
