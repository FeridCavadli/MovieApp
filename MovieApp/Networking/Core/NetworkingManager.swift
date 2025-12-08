//
//  Core.swift
//  MovieApp
//
//  Created by Ferid on 01.12.25.
//

import Foundation
import Alamofire


class NetworkingManager {
    func request<T: Codable>(model: T.Type,
                             url: String,
                             method: HTTPMethod = .get,
                             completion: @escaping ((T?, String?) -> Void)) {
        AF.request(url,
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

}
