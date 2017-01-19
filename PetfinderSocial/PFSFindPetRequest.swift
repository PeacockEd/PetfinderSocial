//
//  PFSFindPetRequest.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 1/18/17.
//  Copyright © 2017 Edward P. Kelly LLC. All rights reserved.
//

import Foundation

class PFSFindPetRequest: PFSBaseRequest {
    
    private var _animal: PFSAnimalType?
    private var _breed: String?
    private var _size: PFSSizeType?
    private var _sex: PFSSexType?
    private var _location: String
    private var _age: PFSAgeType?
    private var _offset: String?
    private var _count: Int?
    
    init(withLocation location: String)
    {
        _location = location
        super.init(apiMethod: .PetSearch)
        urlParams.updateValue(_location, forKey: PFSConstants.paramLocationKey)
    }
    
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
    
    var sex: PFSSexType? {
        get {
            return _sex
        }
        set {
            _sex = newValue
            updateUrlParam(withValue: _sex?.rawValue, forKey: PFSConstants.paramSexKey)
        }
    }
    
    var location: String {
        get {
            return _location
        }
        set {
            _location = newValue
            updateUrlParam(withValue: _location, forKey: PFSConstants.paramLocationKey)
        }
    }
    
    var age: PFSAgeType? {
        get {
            return _age
        }
        set {
            _age = newValue
            updateUrlParam(withValue: _age?.rawValue, forKey: PFSConstants.paramAgeKey)
        }
    }
    
    var offset: String? {
        get {
            return _offset
        }
        set {
            _offset = newValue
            updateUrlParam(withValue: _offset, forKey: PFSConstants.paramOffsetKey)
        }
    }
    
    var count: Int? {
        get {
            return _count
        }
        set {
            _count = newValue
            updateUrlParam(withValue: _count, forKey: PFSConstants.paramCountKey)
        }
    }
}
