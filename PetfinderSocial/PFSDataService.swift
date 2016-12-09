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
    
    func fetchBreedListing(withRequest request: PFSBreedListRequest, completion: @escaping (PFSBreedList) -> ())
    {
        Alamofire.request(request.getRequestUrlWithApiMethod(), method: .get, parameters: request.getRequestUrlParameters(), encoding: URLEncoding.default).responseJSON { response in
            guard let codeResponse = response.response, codeResponse.statusCode == 200,
                response.result.isSuccess == true,
                let value = response.result.value
                else {
                    // TODO : Handle error is some way
                    return
            }
            completion(PFSBreedList.breedListFromJSON(data: JSON(value), forAnimal: request.animal))
        }
    }
    
    func findShelters(withRequest request:PFSFindSheltersRequest, completion: (PFSShelterItem) -> ())
    {
        Alamofire.request(request.getRequestUrlWithApiMethod(), method: .get, parameters: request.getRequestUrlParameters(), encoding: URLEncoding.default).responseJSON { response in
            guard let codeResponse = response.response, codeResponse.statusCode == 200,
                response.result.isSuccess == true, let value = response.result.value
                else {
                    // TODO : Handle error in some way
                    return
            }
            //debugPrint(value)
            let list = PFSShelterList.shelterListFromJSON(data: JSON(value))
        }
    }
}
