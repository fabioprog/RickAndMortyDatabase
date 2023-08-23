//
//  APIRequest.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 13/08/23.
//

import UIKit

final class APIRequest {
    
    static func request<T: Codable>(apiRouter: APIRouter) async throws -> T {
        var components = URLComponents()
        components.host = apiRouter.host
        components.scheme = apiRouter.scheme
        components.path = apiRouter.path
        components.queryItems = apiRouter.parameters
        
        guard let url = components.url else { throw APIRequestError.badUrl }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = apiRouter.method
        
        let session = URLSession(configuration: .default)
        return try await withCheckedThrowingContinuation { continuation in
            if let cachedData = APICache().getCachedData(for: url) {
                do {
                    let responseObject = try JSONDecoder().decode(T.self, from: cachedData)
                    return continuation.resume(with: .success(responseObject))
                }
                catch {
                    return continuation.resume(with: .failure(error))
                }
            }
            
            let task = session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    return continuation.resume(with: .failure(error))
                }
                
                guard let data = data else {
                    return continuation.resume(with: .failure(APIRequestError.noData))
                }
                
                do {
                    let responseObject = try JSONDecoder().decode(T.self, from: data)
                    APICache().setCachedData(for: url, data: data)
                    DispatchQueue.main.async {
                        return continuation.resume(with: .success(responseObject))
                    }
                } catch {
                    return continuation.resume(with: .failure(error))
                }
            }
            task.resume()
        }
    }
}
