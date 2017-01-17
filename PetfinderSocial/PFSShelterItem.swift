//
//  PFSShelterItem.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 12/6/16.
//  Copyright © 2016 Edward P. Kelly LLC. All rights reserved.
//

import Foundation
import SwiftyJSON

struct PFSShelterItem {
    private var _id: String?
    private var _name: String?
    private var _address1: String?
    private var _address2: String?
    private var _city: String?
    private var _state: String?
    private var _zip: String?
    private var _country: String?
    private var _phone: String?
    private var _fax: String?
    private var _email: String?
    
    private var _lat: String?
    private var _lon: String?
    
    private var jsonData: [String: JSON]?
    
    
    init(data: [String: JSON]) {
        jsonData = data
        parseItemData()
    }
    
    private func inspectAndReturnValue(withKey key: String) -> String?
    {
        if let item = jsonData?[key]?.dictionary,
            let value = item[PFSConstants.keyContentProperty]?.string {
            return value
        }
        return nil
    }
    
    mutating private func parseItemData()
    {
        _id = inspectAndReturnValue(withKey: PFSConstants.keyShelterId)
        _name = inspectAndReturnValue(withKey: PFSConstants.keyShelterName)
        _address1 = inspectAndReturnValue(withKey: PFSConstants.keyShelterAddress1)
        _address2 = inspectAndReturnValue(withKey: PFSConstants.keyShelterAddress2)
        _city = inspectAndReturnValue(withKey: PFSConstants.keyShelterCity)
        _state = inspectAndReturnValue(withKey: PFSConstants.keyShelterState)
        _zip = inspectAndReturnValue(withKey: PFSConstants.keyShelterZip)
        _country = inspectAndReturnValue(withKey: PFSConstants.keyShelterCountry)
        _phone = inspectAndReturnValue(withKey: PFSConstants.keyShelterPhone)
        _fax = inspectAndReturnValue(withKey: PFSConstants.keyShelterFax)
        _email = inspectAndReturnValue(withKey: PFSConstants.keyShelterEmail)
        _lat = inspectAndReturnValue(withKey: PFSConstants.keyShelterLatitude)
        _lon = inspectAndReturnValue(withKey: PFSConstants.keyShelterLongitude)
        
        /*
        for (key, json) in data {
            debugPrint("key: \(key), key[jsonItem]: \(json)")
            guard let itemId = json.dictionary?[PFSConstants.keyContentProperty]?.string else {
                continue
            }
        }
        print("*************\n")
        */
    }
    
    static func createShelterItem(withDictionary item: [String: JSON]) -> PFSShelterItem
    {
        return self.init(data: item)
    }
    
    var id: String? {
        get {
            return _id
        }
    }
    
    var name: String? {
        get {
            return _name
        }
    }
    
    var address1: String? {
        get {
            return _address1
        }
    }
    
    var address2: String? {
        get {
            return _address2
        }
    }
    
    var city: String? {
        get {
            return _city
        }
    }
    
    var state: String? {
        get {
            return _state
        }
    }
    
    var zip: String? {
        get {
            return _zip
        }
    }
    
    var country: String? {
        get {
            return _country
        }
    }
    
    var phone: String? {
        get {
            return _phone
        }
    }
    
    var fax: String? {
        get {
            return _fax
        }
    }
    
    var email: String? {
        get {
            return _email
        }
    }
    
    var lat: String? {
        get {
            return _lat
        }
    }
    
    var lon: String? {
        get {
            return _lon
        }
    }
}
