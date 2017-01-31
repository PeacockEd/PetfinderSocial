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
            if let breedsList = JSON(value)[PFSConstants.keyPetfinder][PFSConstants.keyBreeds].dictionary {
                completion(PFSBreedList.breedListFromDictionary(data: breedsList, forAnimal: request.animal))
            }
            //debugPrint(value)
        }
    }
    
    func findShelters(withRequest request: PFSFindSheltersRequest, completion: @escaping (PFSShelterList) -> ())
    {
        Alamofire.request(request.getRequestUrlWithApiMethod(), method: .get, parameters: request.getRequestUrlParameters(), encoding: URLEncoding.default).responseJSON { response in
            guard let codeResponse = response.response, codeResponse.statusCode == 200,
                response.result.isSuccess == true, let value = response.result.value
                else {
                    // TODO : Handle error in some way
                    return
            }
            completion(PFSShelterList.shelterListFromJSON(data: JSON(value)))
        }
    }
    
    func fetchRandomPet(withRequest request: PFSGetRandomPetRequest, completion: @escaping (PFSPetItem?) -> ())
    {
        Alamofire.request(request.getRequestUrlWithApiMethod(), method: .get, parameters: request.getRequestUrlParameters(), encoding: URLEncoding.default).responseJSON { response in
            guard let codeResponse = response.response, codeResponse.statusCode == 200,
                response.result.isSuccess == true, let value = response.result.value
                else {
                    // TODO : Handle error in some way
                    return
            }
            let randomPet = PFSPetItem.createPetItem(withData: JSON(value))
            completion(randomPet)
        }
    }
}
