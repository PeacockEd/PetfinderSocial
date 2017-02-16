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
    static let paramGenericIdKey    = "id"
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
    static let keyResponseHeader    = "header"
    static let keyResponseStatus    = "status"
    static let keyResponseCode      = "code"
    static let keyResponseMessage   = "message"
    static let keyBreeds            = "breeds"
    static let keyBreed             = "breed"
    
    static let keyPet               = "pet"
    static let keyPetName           = "name"
    static let keyPetId             = "id"
    static let keyPetAnimal         = "animal"
    static let keyPetAge            = "age"
    static let keyPetSex            = "sex"
    static let keyPetSize           = "size"
    
    static let keyShelterId         = "shelterId"
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
    
    static let keyPetOptions        = "options"
    static let keyPetOption         = "option"
    static let keyPetMix            = "mix"
    static let keyPetShelterId      = "shelterPetId"
    static let keyPetStatus         = "status"
    static let keyPetDescription    = "description"
    static let keyPetLastUpdate     = "lastUpdate"
    static let keyPetContact        = "contact"
    
    static let keyPetMedia          = "media"
    static let keyPetPhoto          = "photo"
    static let keyPetPhotos         = "photos"
}

public enum PFSAgeType: String {
    case baby   = "Baby"
    case young  = "Young"
    case adult  = "Adult"
    case senior = "Senior"
    case none   = "none"
    
    static func createAgeType(forAge age: String?) -> PFSAgeType {
        var ageType = PFSAgeType.none
        guard let age = age?.lowercased() else {
            return ageType
        }
        
        switch age {
        case "baby":
            ageType = .baby
        case "young":
            ageType = .young
        case "adult":
            ageType = .adult
        case "senior":
            ageType = .senior
        default:
            ageType = .none
        }
        return ageType
    }
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
    case none       = "none"
    
    static func createAnimalType(forAnimal animal: String?) -> PFSAnimalType
    {
        var petType = PFSAnimalType.none
        guard let type = animal?.lowercased() else {
            return petType
        }
        
        switch type {
        case "barnyard" :
            petType = .barnyard
        case "bird" :
            petType = .bird
        case "cat" :
            petType = .cat
        case "dog" :
            petType = .dog
        case "horse" :
            petType = .horse
        case "pig" :
            petType = .pig
        case "reptile" :
            petType = .reptile
        case "smallfurry" :
            petType = .smallfurry
        default :
            petType = .none
        }
        return petType
    }
}

public enum PFSGenderType: String {
    case male   = "M"
    case female = "F"
    case none   = "none"
    
    static func createGenderType(forGender gender: String?) -> PFSGenderType {
        var genderType = PFSGenderType.none
        guard let gender = gender?.lowercased() else {
            return genderType
        }
        
        switch gender {
        case "m":
            genderType = .male
        case "f":
            genderType = .female
        default:
            genderType = .none
        }
        return genderType
    }
}

public enum PFSPetOption: String {
    case specialNeeds   = "specialNeeds"
    case noDogs         = "noDogs"
    case noCats         = "noCats"
    case noKids         = "noKids"
    case noClaws        = "noClaws"
    case hasShots       = "hasShots"
    case housebroken    = "housebroken"
    case housetrained   = "housetrained"
    case altered        = "altered"
    case unknown        = "unknown"
    
    static func createOptionType(forOption option: String?) -> PFSPetOption {
        var optionType = PFSPetOption.unknown
        guard let option = option?.lowercased() else {
            return optionType
        }
        
        switch option {
        case "specialneeds":
            optionType = .specialNeeds
        case "nodogs":
            optionType = .noDogs
        case "nocats":
            optionType = .noCats
        case "nokids":
            optionType = .noKids
        case "noclaws":
            optionType = .noClaws
        case "hasshots":
            optionType = .hasShots
        case "housebroken":
            optionType = .housebroken
        case "housetrained":
            optionType = .housetrained
        case "altered":
            optionType = .altered
        default:
            optionType = .unknown
        }
        return optionType
    }
}

public enum PFSPetStatusType: String {
    case a          = "adoptable"
    case h          = "hold"
    case p          = "pending"
    case x          = "unavailable"
    case unknown    = "unknown"
    
    static func createPetStatusType(forStatus status: String?) -> PFSPetStatusType {
        var statusType = PFSPetStatusType.unknown
        guard let status = status?.lowercased() else {
            return statusType
        }
        
        switch status {
        case "a":
            statusType = .a
        case "h":
            statusType = .h
        case "p":
            statusType = .p
        case "x":
            statusType = .x
        default:
            statusType = .unknown
        }
        return statusType
    }
}

public enum PFSSizeType: String {
    case small          = "S"
    case medium         = "M"
    case large          = "L"
    case extra_large    = "XL"
    case none           = "none"
    
    static func createSizeType(forSize size: String?) -> PFSSizeType {
        var sizeType = PFSSizeType.none
        guard let size = size?.lowercased() else {
            return sizeType
        }
        
        switch size {
        case "s":
            sizeType = .small
        case "m":
            sizeType = .medium
        case "l":
            sizeType = .large
        case "xl":
            sizeType = .extra_large
        default:
            sizeType = .none
        }
        return sizeType
    }
}
