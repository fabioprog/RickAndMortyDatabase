//
//  APICache.swift
//  RickMortyDatabase
//
//  Created by Fabio Augusto Resende on 13/08/23.
//

import UIKit

class APICache {
    
    private var cacheData = NSCache<NSString, NSData>()
    
    func getCachedData(for url: URL?) -> Data? {
        guard let url = url else { return nil }
        
        let key = url.absoluteString as NSString
        
        return cacheData.object(forKey: key) as? Data
    }

    func setCachedData(for url: URL?, data: Data) {
        guard let url = url else { return }
       
        let key = url.absoluteString as NSString
        let cacheData = NSCache<NSString, NSData>()
       
        cacheData.setObject(data as NSData, forKey: key)
    }
}

