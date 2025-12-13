//
//  MovieDetailCell.swift
//  MovieApp
//
//  Created by Ferid on 13.12.25.
//

import UIKit

class MovieDetailCell: UICollectionViewCell {
    let movieImage: UIImageView = {
        let l = UIImageView()
        l.contentMode = .scaleAspectFill
        l.translatesAutoresizingMaskIntoConstraints = false
        l.layer.masksToBounds = true
        l.layer.cornerRadius = 12
        return l
    }()
    let movieName: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
//        l.backgroundColor = .yellow
        return l
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstrains()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureCell(model: LabelImageProtocol) {
        let path = model.imageURL
        let fullUrl = "https://image.tmdb.org/t/p/original\(path)"

        movieImage.downloadImage(from: fullUrl) { response in
            DispatchQueue.main.async {
                self.movieImage.image = response.image
            }
        }
        self.movieName.text = model.titleText
    }


    func configureConstrains() {
        contentView.addSubview(movieImage)
        contentView.addSubview(movieName)
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImage.leadingAnchor
                .constraint(
                    equalTo: contentView.leadingAnchor
                ),
            movieImage.bottomAnchor
                .constraint(equalTo: movieName.topAnchor, constant: 8),
            movieImage.trailingAnchor
                .constraint(
                    equalTo: contentView.trailingAnchor
                ),
            movieImage.heightAnchor.constraint(equalToConstant: 240),
            movieName.leadingAnchor
                .constraint(equalTo: movieImage.leadingAnchor),
            movieName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            movieName.trailingAnchor
                .constraint(equalTo: movieImage.trailingAnchor)
        ])
    }
}
