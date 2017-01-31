//
//  PFSFindPetBaseRequest.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 1/19/17.
//  Copyright © 2017 Edward P. Kelly LLC. All rights reserved.
//

import Foundation

class PFSFindPetBaseRequest: PFSBaseRequest {
    
    private var _animal: PFSAnimalType?
    private var _breed: String?
    private var _size: PFSSizeType?
    private var _sex: PFSGenderType?
    
    
    var animal: PFSAnimalType? {
        get {
            return _animal
        }
        set {
            _animal = newValue
            updateUrlParam(withValue: _animal?.rawValue, forKey: PFSConstants.paramAnimalKey)
        }
    }
    
    var breed: String? {
        get {
            return _breed
        }
        set {
            _breed = newValue
            updateUrlParam(withValue: _breed, forKey: PFSConstants.paramBreedKey)
        }
    }
    
    var size: PFSSizeType? {
        get {
            return _size
        }
        set {
            _size = newValue
            updateUrlParam(withValue: _size?.rawValue, forKey: PFSConstants.paramSizeKey)
        }
    }
    
    var sex: PFSGenderType? {
        get {
            return _sex
        }
        set {
            _sex = newValue
            updateUrlParam(withValue: _sex?.rawValue, forKey: PFSConstants.paramSexKey)
        }
    }
}
