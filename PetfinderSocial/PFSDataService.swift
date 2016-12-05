//
//  PFSDataService.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 11/22/16.
//  Copyright © 2016 Edward P. Kelly LLC. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PFSDataService {
    static let instance = PFSDataService()
    
    func fetchBreedListing(withRequest request: PFSBaseRequest, completion: @escaping (JSON) -> ())
    {
        Alamofire.request(request.getRequestUrlWithApiMethod(), method: .get, parameters: request.getRequestUrlParameters(), encoding: URLEncoding.default).responseJSON { response in
            guard let codeResponse = response.response, codeResponse.statusCode == 200,
                response.result.isSuccess == true,
                let value = response.result.value
            else {
                    // TODO : Handle error is some way
                    return
            }
            completion(JSON(value))
        }
    }
}
