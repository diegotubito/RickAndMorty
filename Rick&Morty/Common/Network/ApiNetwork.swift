//
//  ApiNetwork.swift
//  Rick&Morty
//
//  Created by David Diego Gomez on 05/09/2023.
//

import Foundation

open class ApiNetworkAsync {
    public var config: ApiRequestConfiguration
    let session: URLSession
    
    public init() {
        config = ApiRequestConfiguration()
        session = URLSession(configuration: .default)
    }
    
    public func apiCall<T: Decodable>() async throws -> T {
        
        do {
            let data = try await performRequest()
            // If T is of type Data, return the data directly without decoding
            if T.self == Data.self {
                return data as! T
            }
            
            let decoder = JSONDecoder()
            JSONDecoder().keyDecodingStrategy = .convertFromSnakeCase
            let genericData = try decoder.decode(T.self, from: data)
            return genericData
        } catch let error as APIError {
            throw error
        } catch {
            print(error.localizedDescription)
            print(error)
            throw error
        }
        
    }
    
    private func performRequest() async throws -> Data {
        guard let url = config.getUrl() else {
            throw APIError.wrongUrl
        }
        
        guard let method = config.method else {
            throw APIError.unhandleError
        }
        
        return try await doTask(request: createRequest(url: url, method: method) )
    }
    
    private func createRequest(url: URL, method: ApiRequestConfiguration.Method) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        for header in config.headers {
            request.setValue(header.value, forHTTPHeaderField: header.key)
        }
        if let body = config.body {
            request.httpBody = body
        }
        
        return request
    }
        
    private func doTask(request: URLRequest) async throws -> Data {
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.unhandleError
        }
   
        guard (200...299).contains(httpResponse.statusCode)
        else {
            switch httpResponse.statusCode {
            case 404:
                throw APIError.notFound
            default:
                throw APIError.unhandleError
            }
        }

        return data
    }
}



