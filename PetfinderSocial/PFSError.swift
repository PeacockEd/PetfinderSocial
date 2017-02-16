//
//  PFSError.swift
//  PetfinderSocial
//
//  Created by Ed Kelly on 2/7/17.
//  Copyright © 2017 Edward P. Kelly LLC. All rights reserved.
//

import Foundation

struct PFSErrorStrings {
    static let unknownErrorMessage = "No further error details available."
}

public enum StatusCodes: Int {
    case UNABLE_TO_COMPLETE_REQUEST = 400
    
    case PFAPI_OK = 100
    case PFAPI_ERR_INVALID = 200
    case PFAPI_ERR_NOENT = 201
    case PFAPI_ERR_LIMIT = 202
    case PFAPI_ERR_LOCATION = 203
    case PFAPI_ERR_UNAUTHORIZED = 300
    case PFAPI_ERR_AUTHFAIL = 301
    case PFAPI_ERR_INTERNAL = 999
    case PFAPI_UNKNOWN_ERROR = 1000
    
    var description: String {
        switch self {
        case .UNABLE_TO_COMPLETE_REQUEST:
            return "Unable to complete request"
        case .PFAPI_OK:
            return "No error"
        case .PFAPI_ERR_INVALID:
            return "Invalid request"
        case .PFAPI_ERR_NOENT:
            return "Record does not exist"
        case .PFAPI_ERR_LIMIT:
            return "A limit was exceeded"
        case .PFAPI_ERR_LOCATION:
            return "Invalid geographical location"
        case .PFAPI_ERR_UNAUTHORIZED:
            return "Request is unauthorized"
        case .PFAPI_ERR_AUTHFAIL:
            return "Authentication failure"
        case .PFAPI_ERR_INTERNAL:
            return "Generic internal error"
        case .PFAPI_UNKNOWN_ERROR:
            return "An unknown error has occurred"
        }
    }
}

public enum PFSError: Error {
    case petfinderApiError(code: Int, description: String, message: String)
    case genericServerError(code: Int, description: String, message: String)
    
    var errorCode: Int {
        switch self {
        case .petfinderApiError(let code, _, _):
            return code
        case .genericServerError(let code, _, _):
            return code
        }
    }
    
    var errorDescription: String {
        switch self {
        case .petfinderApiError(_, let description, _):
            return description
        case .genericServerError(_, let description, _):
            return description
        }
    }
    
    var errorMessage: String {
        switch self {
        case .petfinderApiError(_, _, let message):
            return message
        case .genericServerError(_, _, let message):
            return message
        }
    }
}
