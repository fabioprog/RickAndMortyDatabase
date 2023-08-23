//
//  ImageLoader.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 13/08/23.
//

import UIKit

final class ImageLoader {
        
    func downloadImage(_ url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        if let cachedData = APICache().getCachedData(for: url) {
            completion(.success(cachedData as Data))
            return
        }
                
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            APICache().setCachedData(for: url, data: data)
            completion(.success(data))
        }
        task.resume()
    }
}

