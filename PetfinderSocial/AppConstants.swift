//
//  AppConstants.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 11/23/16.
//  Copyright © 2016 Edward P. Kelly LLC. All rights reserved.
//

import Foundation

struct APIConstants {
    static let API_BASE_URL = "https://api.petfinder.com/"
}

struct PFSConstants {
    // API defaults
    static let defaultRecordCount   = 25
    static let defaultRecordOffset  = 0
    
    // API parameter names/keys
    static let paramKey             = "key"
    static let paramFormat          = "format"
    static let paramOutput          = "output"
    static let paramAnimalKey       = "animal"
    static let paramLocationKey     = "location"
    static let paramShelterNameKey  = "name"
    static let paramOffsetKey       = "offset"
    static let paramCountKey        = "count"

    // Content description keys
    static let keyContentProperty   = "$t"
    static let keyPetfinder         = "petfinder"
    static let keyBreeds            = "breeds"
    static let keyBreed             = "breed"
}
