//
//  MockRequest.swift
//  RickAndMortyDatabaseTests
//
//  Created by Fabio Augusto Resende on 16/08/23.
//

import Foundation

final class MockRequest {
    static func getFile<T: Codable>(by path: String) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            if let url = Bundle(for: type(of: MockRequest())).url(forResource: path, withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let jsonData = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        return continuation.resume(with: .success(jsonData))
                    }
                } catch {
                    return continuation.resume(with: .failure(error))
                }
            }
        }
    }
}
