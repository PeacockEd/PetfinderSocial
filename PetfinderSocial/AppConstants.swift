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
    static let recodLastOffset      = "lastOffset"
    
    // API parameter names/keys
    static let paramKey             = "key"
    static let paramFormat          = "format"
    static let paramOutput          = "output"
    static let paramAnimalKey       = "animal"
    static let paramBreedKey        = "breed"
    static let paramSizeKey         = "size"
    static let paramSexKey          = "sex"
    static let paramAgeKey          = "age"
    static let paramLocationKey     = "location"
    static let paramShelterNameKey  = "name"
    static let paramShelterIdKey    = "shelterid"
    static let paramOffsetKey       = "offset"
    static let paramCountKey        = "count"

    // Content description keys
    static let keyContentProperty   = "$t"
    static let keyPetfinder         = "petfinder"
    static let keyBreeds            = "breeds"
    static let keyBreed             = "breed"
    
    static let keyShelterId         = "id"
    static let keyShelterState      = "state"
    static let keyShelterCity       = "city"
    static let keyShelterAddress1   = "address1"
    static let keyShelterAddress2   = "address2"
    static let keyShelterZip        = "zip"
    static let keyShelterCountry    = "country"
    static let keyShelterName       = "name"
    static let keyShelterEmail      = "email"
    static let keyShelterPhone      = "phone"
    static let keyShelterFax        = "fax"
    static let keyShelterLatitude   = "latitude"
    static let keyShelterLongitude  = "longitude"
}

public enum PFSAnimalType: String {
    case barnyard   = "barnyard"
    case bird       = "bird"
    case cat        = "cat"
    case dog        = "dog"
    case horse      = "horse"
    case pig        = "pig"
    case reptile    = "reptile"
    case smallfurry = "smallfurry"
}

public enum PFSSizeType: String {
    case small          = "small"
    case medium         = "medium"
    case large          = "large"
    case extra_large    = "extra-large"
}

public enum PFSSexType: String {
    case male   = "M"
    case female = "F"
}

public enum PFSAgeType: String {
    case baby   = "Baby"
    case young  = "Young"
    case adult  = "Adult"
    case senior = "Senior"
}
