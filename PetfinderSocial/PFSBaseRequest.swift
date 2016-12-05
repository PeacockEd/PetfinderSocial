//
//  PFSBaseRequest.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 11/23/16.
//  Copyright © 2016 Edward P. Kelly LLC. All rights reserved.
//

import Foundation
import Alamofire

enum APIMethod: String {
    case BreedList          = "breed.list"
    case PetById            = "pet.get"
    case RandomPet          = "pet.getRandom"
    case PetSearch          = "pet.find"
    case ShelterSearch      = "shelter.find"
    case ShelterById        = "shelter.get"
    case PetsByShelterId    = "shelter.getPets"
    case SheltersByBreed    = "shelter.listByBreed"
}

enum APIOutputType: String {
    case id     = "id"
    case basic  = "basic"
    case full   = "full"
}

enum APIResponseFormat: String {
    case json   = "json"
    case xml    = "xml"
}

class PFSBaseRequest {
    
    let baseUrl = APIConstants.API_BASE_URL
    private var _method: APIMethod!
    private var _outputType = APIOutputType.full
    private var _responseFormat = APIResponseFormat.json
    private var _urlParams = Parameters()
    
    
    init(apiMethod: APIMethod) {
        _method = apiMethod
    }
    
    func getRequestUrlWithApiMethod() -> String
    {
        return "\(baseUrl)\(_method.rawValue)"
    }
    
    func getRequestUrlParameters() -> Parameters
    {
        if _urlParams.count > 0 {
            _urlParams.updateValue(APIKey.key, forKey: PFSConstants.paramKey)
            _urlParams.updateValue(_responseFormat.rawValue, forKey: PFSConstants.paramFormat)
            _urlParams.updateValue(_outputType.rawValue, forKey: PFSConstants.paramOutput)
        }
        return _urlParams
    }
    
    var urlParams: Parameters {
        set {
            _urlParams = newValue
        }
        get {
            return _urlParams
        }
    }
    
    var method: APIMethod {
        set {
            _method = newValue
        }
        get {
            return _method
        }
    }
    
    var outputType: APIOutputType {
        set {
            _outputType = newValue
        }
        get {
            return _outputType
        }
    }
    
    var responseFormat: APIResponseFormat {
        set {
            _responseFormat = newValue
        }
        get {
            return _responseFormat
        }
    }
}
