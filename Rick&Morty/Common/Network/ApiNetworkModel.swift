//
//  ApiNetworkModel.swift
//  Rick&Morty
//
//  Created by David Diego Gomez on 05/09/2023.
//
import Foundation

enum APIError: Equatable, Error, CustomStringConvertible {
    case notFound
    case imageNotFound
    case wrongUrl
    case httpUrlResponseCast
    case unhandleError
    case backendError(message: String)
    case mockFailed
    case jsonFileNotFound(filename: String?)
    case serialize
    
    var message: String {
        switch self {
        case .notFound:
            return "Not found"
        case .imageNotFound:
            return "Image not found."
        case .wrongUrl:
            return "Wrong URL"
        case .backendError(message: let message): return message
        case .httpUrlResponseCast:
            return "Could not cast HTTPUrlResponse"
        case .unhandleError:
            return "Unhandled error from backend"
        case .mockFailed:
            return "Mock file not found"
        case .jsonFileNotFound(filename: let filename):
            return "\(String(describing: filename)) not exist."
        case .serialize:
            return "Could not Serialize"
        }
    }
    
    public var description: String {
        return "🧨⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽\nmessage: \(self.message)\n⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺"
    }
}
