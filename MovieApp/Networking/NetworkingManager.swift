//
//  Core.swift
//  MovieApp
//
//  Created by Ferid on 01.12.25.
//

import Foundation
import Alamofire
import UIKit

class NetworkingManager {
    func request<T: Codable>(model: T.Type,
                             endpoint: BaseUrl,
                             method: HTTPMethod,
                             completion: @escaping ((T?, String?) -> Void)) {
        AF.request(endpoint.fullUrl,
                   method: method,
                   encoding: JSONEncoding.default,
                   headers: NetworkingHelper.shared.headers).responseDecodable(
                    of: T.self
                   ) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }

    func imageRequest(urlString: String ,completion: @escaping ((UIImage?) -> Void)) {
        AF.request(urlString).responseData { response in
            switch response.result {
            case .success(let data):
                print("Image created successfully")
                if let image = UIImage(data: data) {
                    completion(image)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
