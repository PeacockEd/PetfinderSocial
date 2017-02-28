//
//  PFSFindPetRequest.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 1/18/17.
//  Copyright © 2017 Edward P. Kelly LLC. All rights reserved.
//

import Foundation

class PFSFindPetRequest: PFSFindPetBaseRequest {
    
    private var _age: PFSAgeType?
    private var _offset: String?
    private var _count: Int?
    
    
    init() {
        super.init(apiMethod: .PetSearch)
    }
    
    convenience init(withLocation location: String, age: PFSAgeType) {
        self.init()
        self.location = location
        self.age = age
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
