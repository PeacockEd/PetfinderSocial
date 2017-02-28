//
//  PFSGetPetByIdRequest.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 2/27/17.
//  Copyright © 2017 Edward P. Kelly LLC. All rights reserved.
//

import Foundation

class PFSGetPetByIdRequest: PFSBaseRequest {
    
    private var _petId: Int?
    
    init(withPetId petId: Int) {
        _petId = petId
        super.init(apiMethod: .PetById)
        updateUrlParam(withValue: _petId, forKey: PFSConstants.keyPetId)
    }
    
    var petId: Int? {
        get {
            return _petId
        }
        set {
            _petId = newValue
            updateUrlParam(withValue: _petId, forKey: PFSConstants.keyPetId)
        }
    }
}
