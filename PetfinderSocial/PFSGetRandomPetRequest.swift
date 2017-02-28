//
//  PFSGetRandomPetRequest.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 1/19/17.
//  Copyright © 2017 Edward P. Kelly LLC. All rights reserved.
//

import Foundation

class PFSGetRandomPetRequest: PFSFindPetBaseRequest {
    
    private var _shelterId: String?
    
    
    init() {
        super.init(apiMethod: .RandomPet)
    }
    
    convenience init(withShelterId shelterId: String) {
        self.init()
        self.shelterId = shelterId
    }
    
    convenience init(withLocation location: String, shelterId: String) {
        self.init()
        self.location = location
        self.shelterId = shelterId
    }
    
    var shelterId: String? {
        get {
            return _shelterId
        }
        set {
            _shelterId = newValue
            updateUrlParam(withValue: _shelterId, forKey: PFSConstants.paramShelterIdKey)
        }
    }
}
