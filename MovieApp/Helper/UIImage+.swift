//
//  UIImage+.swift
//  MovieApp
//
//  Created by Ferid on 05.12.25.
//

import UIKit
import Alamofire

extension UIImageView {
    func downloadImage(from URLString: String, with completion: @escaping (_ response: (status: Bool, image: UIImage? ) ) -> Void) {

        guard let url = URL(string: URLString) else {
            completion((status: false, image: nil))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion((status: false, image: nil))
                return
            }

            guard let httpURLResponse = response as? HTTPURLResponse,
                  httpURLResponse.statusCode == 200,
                  let data = data else {
                completion((status: false, image: nil))
                return
            }

            let image = UIImage(data: data)
            completion((status: true, image: image))
        }.resume()
    }
}
