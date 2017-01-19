//
//  PFSFindSheltersRequest.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 12/6/16.
//  Copyright © 2016 Edward P. Kelly LLC. All rights reserved.
//

import Foundation

class PFSFindSheltersRequest: PFSBaseRequest {
    
    private var _location: String
    private var _name: String?
    private var _offset: Int?
    private var _count: Int?
    
    init(withLocation location: String, recordCount: Int, recordOffset: Int)
    {
        _location = location
        super.init(apiMethod: .ShelterSearch)
        urlParams.updateValue(_location, forKey: PFSConstants.paramLocationKey)
    }
    
    convenience init(withLocation location: String)
    {
        self.init(withLocation: location, recordCount: PFSConstants.defaultRecordCount, recordOffset: PFSConstants.defaultRecordOffset)
    }
    
    var location: String {
        get {
            return _location
        }
        set {
            _location = newValue
            urlParams.updateValue(_location, forKey: PFSConstants.paramLocationKey)
        }
    }
    
    var name: String? {
        get {
            return _name
        }
        set {
            _name = newValue
            urlParams.updateValue(_name!, forKey: PFSConstants.paramShelterNameKey)
        }
    }
    
    var offset: Int? {
        get {
            return _offset
        }
        set {
            _offset = newValue
            urlParams.updateValue(_offset!, forKey: PFSConstants.paramOffsetKey)
        }
    }
    
    var count: Int? {
        get {
            return _count
        }
        set {
            _count = newValue
            urlParams.updateValue(_count!, forKey: PFSConstants.paramCountKey)
        }
    }
}
