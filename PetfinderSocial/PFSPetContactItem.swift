//
//  PFSPetContactItem.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 1/31/17.
//  Copyright © 2017 Edward P. Kelly LLC. All rights reserved.
//

import Foundation
import SwiftyJSON

struct PFSPetContactItem {
    
    private var _name: String?
    private var _address1: String?
    private var _address2: String?
    private var _city: String?
    private var _state: String?
    private var _zip: String?
    private var _phone: String?
    private var _fax: String?
    private var _email: String?
    
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
        _name = inspectAndReturnValue(withKey: PFSConstants.keyShelterName)
        _address1 = inspectAndReturnValue(withKey: PFSConstants.keyShelterAddress1)
        _address2 = inspectAndReturnValue(withKey: PFSConstants.keyShelterAddress2)
        _city = inspectAndReturnValue(withKey: PFSConstants.keyShelterCity)
        _state = inspectAndReturnValue(withKey: PFSConstants.keyShelterState)
        _zip = inspectAndReturnValue(withKey: PFSConstants.keyShelterZip)
        _phone = inspectAndReturnValue(withKey: PFSConstants.keyShelterPhone)
        _fax = inspectAndReturnValue(withKey: PFSConstants.keyShelterFax)
        _email = inspectAndReturnValue(withKey: PFSConstants.keyShelterEmail)
    }
    
    static func createContactItem(withDictionary data: [String: JSON]) -> PFSPetContactItem {
        return self.init(data: data)
    }
}
