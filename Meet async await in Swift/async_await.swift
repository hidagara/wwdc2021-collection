//
//  example.swift
//  wwdc2021-collection
//
//  Created by Media Guest on 28.06.2021.
//



import Foundation
import UIKit

enum FetchError: Error {
    case badId
    case badImage
}


func thumbnailURLRequest(for id: String) -> URLRequest {
    return URLRequest(url: URL(string: id)!)
}

// Async operations before - using completion handler
//
@available(iOS 15.0, *)
func fetchThumbnail(for id: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
    let request = thumbnailURLRequest(for: id)
    
    let task = URLSession.shared.dataTask(with: request) {
        data, response, error in
        
        if let error = error {
            completion(.failure(error))
        } else if (response as? HTTPURLResponse)?.statusCode != 200 {
            completion(.failure(FetchError.badId))
        } else {
            guard let image = UIImage(data: data!) else {
                return
            }
            image.prepareThumbnail(of: CGSize(width: 40, height: 40)) { thumbnail in
                guard let thumbnail = thumbnail else {
                    return
                }
                completion(.success(thumbnail))
            }
        }
    }
    task.resume()
}


// New way with async/await

@available(iOS 15.0, *)
func fetchThumbnail(for id: String) async throws -> UIImage {
    let request = thumbnailURLRequest(for: id)
    
    let (data, response) = try await URLSession.shared.data(for: request)
    guard (response as? HTTPURLResponse)?.statusCode == 200 else {
        throw FetchError.badId
    }
    
    let maybeImage = UIImage(data: data)
    
    guard let thumbnail = await maybeImage?.thumbnail else { throw FetchError.badImage }
    return thumbnail
}


// Only read-only properties can be async
@available(iOS 15.0, *)
extension UIImage {
    var thumbnail: UIImage? {
        get async {
            let size = CGSize(width: 40, height: 40)
            return await self.byPreparingThumbnail(ofSize: size)
        }
    }
}

// Async sequences with for await (WWDC2021 -  Meet AsyncSequence)
/*
    for await id in staticImageIDsURL.lines {
        let thumbnail = await fetchThumbnail(for: id)
        collage.add(thumbnail)
    }
    let result = await collage.draw()
 */
