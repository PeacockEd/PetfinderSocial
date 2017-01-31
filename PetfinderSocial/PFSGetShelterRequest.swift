//
//  PFSGetShelterRequest.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 1/20/17.
//  Copyright © 2017 Edward P. Kelly LLC. All rights reserved.
//

import Foundation

class PFSGetShelterRequest: PFSBaseRequest {
    
    private var _shelterId: String

    init(withShelterId shelterId: String) {
        _shelterId = shelterId
        super.init(apiMethod: .ShelterById)
        updateUrlParam(withValue: _shelterId, forKey: PFSConstants.paramGenericIdKey)
    }
    
    var shelterId: String {
        get {
            return _shelterId
        }
        set {
            _shelterId = newValue
            updateUrlParam(withValue: _shelterId, forKey: PFSConstants.paramGenericIdKey)
        }
    }
}
