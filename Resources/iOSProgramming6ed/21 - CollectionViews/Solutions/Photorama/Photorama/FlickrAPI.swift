//
//  Copyright © 2015 Big Nerd Ranch
//

import Foundation

enum Method: String {
    case interestingPhotos = "flickr.interestingness.getList"
}

enum FlickrError: Error {
    case invalidJSONData
}

private let baseURLString = "https://api.flickr.com/services/rest"
private let apiKey = "a6d819499131071f158fd740860a5a88"

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return formatter
}()

struct FlickrAPI {
    
    static var interestingPhotosURL: URL {
        return flickrURL(method: .interestingPhotos,
                         parameters: ["extras": "url_h,date_taken"])
    }
    
    private static func flickrURL(method: Method,
        parameters: [String:String]?) -> URL {
            var components = URLComponents(string: baseURLString)!
            
            var queryItems = [URLQueryItem]()
            
            let baseParams = [
                "method": method.rawValue,
                "format": "json",
                "nojsoncallback": "1",
                "api_key": apiKey
            ]
            
            for (key, value) in baseParams {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
            
            if let additionalParams = parameters {
                for (key, value) in additionalParams {
                    let item = URLQueryItem(name: key, value: value)
                    queryItems.append(item)
                }
            }
            components.queryItems = queryItems
            
            return components.url!
    }
    
    static func photos(fromJSON data: Data) -> PhotosResult {
        
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            
            guard
                let jsonDictionary = jsonObject as? [AnyHashable:Any],
                let photos = jsonDictionary["photos"] as? [String:Any],
                let photosArray = photos["photo"] as? [[String:Any]] else {
                    
                    // The JSON structure doesn't match our expectations
                    return .failure(FlickrError.invalidJSONData)
            }
            
            var finalPhotos = [Photo]()
            for photoJSON in photosArray {
                if let photo = photo(fromJSON: photoJSON) {
                    finalPhotos.append(photo)
                }
            }
            
            if finalPhotos.isEmpty && !photosArray.isEmpty {
                // We weren't able to parse any of the photos.
                // Maybe the JSON format for photos has changed.
                return .failure(FlickrError.invalidJSONData)
            }
            return .success(finalPhotos)
        } catch let error {
            return .failure(error)
        }
    }
    
    private static func photo(fromJSON json: [String : Any]) -> Photo? {
        guard
            let photoID = json["id"] as? String,
            let title = json["title"] as? String,
            let dateString = json["datetaken"] as? String,
            let photoURLString = json["url_h"] as? String,
            let url = URL(string: photoURLString),
            let dateTaken = dateFormatter.date(from: dateString) else {
                
                // Don't have enough information to construct a Photo
                return nil
        }
        
        return Photo(title: title, photoID: photoID, remoteURL: url, dateTaken: dateTaken)
    }
    
}
