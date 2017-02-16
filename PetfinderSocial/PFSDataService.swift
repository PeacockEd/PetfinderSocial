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
    
    func fetchBreedListing(withRequest request: PFSBreedListRequest, completion: @escaping (PFSBreedList?, PFSError?) -> ())
    {
        Alamofire.request(request.getRequestUrlWithApiMethod(), method: .get, parameters: request.getRequestUrlParameters(), encoding: URLEncoding.default).responseJSON { response in
            var error: PFSError? = nil
            guard let codeResponse = response.response, codeResponse.statusCode == 200,
                response.result.isSuccess == true, let value = response.result.value
                else {
                    let statusCode = StatusCodes.UNABLE_TO_COMPLETE_REQUEST
                    error = PFSError.genericServerError(code: statusCode.rawValue, description: statusCode.description, message: statusCode.description)
                    completion(nil, error)
                    return
            }
            if let breedsList = JSON(value)[PFSConstants.keyPetfinder][PFSConstants.keyBreeds].dictionary {
                completion(PFSBreedList.breedListFromDictionary(data: breedsList, forAnimal: request.animal), nil)
            }
            //debugPrint(value)
        }
    }
    
    func findShelters(withRequest request: PFSFindSheltersRequest, completion: @escaping (PFSShelterList?, PFSError?) -> ())
    {
        Alamofire.request(request.getRequestUrlWithApiMethod(), method: .get, parameters: request.getRequestUrlParameters(), encoding: URLEncoding.default).responseJSON { response in
            var error: PFSError? = nil
            guard let codeResponse = response.response, codeResponse.statusCode == 200,
                response.result.isSuccess == true, let value = response.result.value
                else {
                    let statusCode = StatusCodes.UNABLE_TO_COMPLETE_REQUEST
                    error = PFSError.genericServerError(code: statusCode.rawValue, description: statusCode.description, message: statusCode.description)
                    completion(nil, error)
                    return
            }
            if let code = JSON(value)[PFSConstants.keyPetfinder][PFSConstants.keyResponseHeader][PFSConstants.keyPetStatus][PFSConstants.keyResponseCode].dictionary,
                let respCode = code[PFSConstants.keyContentProperty]?.string,
                let intCode = Int(respCode), intCode > 100 {
                let statusCode = StatusCodes(rawValue: intCode) ?? StatusCodes.PFAPI_UNKNOWN_ERROR
                var errorMsg = PFSErrorStrings.unknownErrorMessage
                if let msg = JSON(value)[PFSConstants.keyPetfinder][PFSConstants.keyResponseHeader][PFSConstants.keyPetStatus][PFSConstants.keyResponseCode].dictionary,
                    let msgStr = msg[PFSConstants.keyContentProperty]?.string {
                    errorMsg = msgStr
                }
                error = PFSError.petfinderApiError(code: statusCode.rawValue, description: statusCode.description, message: errorMsg)
                completion(nil, error)
                return
            }
            completion(PFSShelterList.shelterListFromJSON(data: JSON(value)), nil)
        }
    }
    
    func fetchRandomPet(withRequest request: PFSGetRandomPetRequest, completion: @escaping (PFSPetItem?, PFSError?) -> ())
    {
        Alamofire.request(request.getRequestUrlWithApiMethod(), method: .get, parameters: request.getRequestUrlParameters(), encoding: URLEncoding.default).responseJSON { response in
            var error: PFSError? = nil
            guard let codeResponse = response.response, codeResponse.statusCode == 200,
                response.result.isSuccess == true, let value = response.result.value
                else {
                    let statusCode = StatusCodes.UNABLE_TO_COMPLETE_REQUEST
                    error = PFSError.genericServerError(code: statusCode.rawValue, description: statusCode.description, message: statusCode.description)
                    completion(nil, error)
                    return
            }
            if let code = JSON(value)[PFSConstants.keyPetfinder][PFSConstants.keyResponseHeader][PFSConstants.keyPetStatus][PFSConstants.keyResponseCode].dictionary,
                let respCode = code[PFSConstants.keyContentProperty]?.string,
                let intCode = Int(respCode), intCode > 100 {
                let statusCode = StatusCodes(rawValue: intCode) ?? StatusCodes.PFAPI_UNKNOWN_ERROR
                var errorMsg = PFSErrorStrings.unknownErrorMessage
                if let msg = JSON(value)[PFSConstants.keyPetfinder][PFSConstants.keyResponseHeader][PFSConstants.keyPetStatus][PFSConstants.keyResponseMessage].dictionary,
                    let msgStr = msg[PFSConstants.keyContentProperty]?.string {
                    errorMsg = msgStr
                }
                error = PFSError.petfinderApiError(code: statusCode.rawValue, description: statusCode.description, message: errorMsg)
                completion(nil, error)
                return
            }
            completion(PFSPetItem.createPetItem(withData: JSON(value)), nil)
        }
    }
}
