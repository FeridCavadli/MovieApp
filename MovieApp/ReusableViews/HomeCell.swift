//
//  HomeCell.swift
//  MovieApp
//
//  Created by Ferid on 01.12.25.
//

import UIKit


class HomeCell: UICollectionViewCell {

    let viewModel = HomeVM()

    var items: [MovieResult] = []

    var onTap: (() -> Void)?



    let movieType: UILabel = {
        let l = UILabel()
        l.numberOfLines = 0
        l.textAlignment = .center
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    let button: UIButton = {
        let b = UIButton()
        b.setTitleColor(.blue, for: .normal)
        b.setTitle("See all", for: .normal)
        b.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        b.semanticContentAttribute = .forceRightToLeft
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()

    let cellCollection: UICollectionView = {
        let l = UICollectionViewFlowLayout()
        l.scrollDirection = .horizontal
        l.minimumLineSpacing = 16
        l.minimumInteritemSpacing = 0
        l.sectionInset = .init(top: 0, left: 24, bottom: 0, right: 0)
        let c = UICollectionView(frame: .zero, collectionViewLayout: l)
        c.translatesAutoresizingMaskIntoConstraints = false
        return c
    }()

    @objc func seeAll() {
        onTap?()
    }

    override init(frame: CGRect) { 
        super.init(frame: frame)
        button.addTarget(
                self,
                action: #selector(seeAll),
                for: .touchUpInside
            )
        configureConstrains()
        cellCollection.dataSource = self
        cellCollection.delegate = self
        cellCollection.register(LabelImageCell.self, forCellWithReuseIdentifier: "LabelImageCell")
        configureViewModel()
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureViewModel() {
        viewModel.getMovies()
        viewModel.success = {
            self.cellCollection.reloadData()
        }
        viewModel.error = { errorMessage in
            print(errorMessage)
        }
    }

    func configureCell(model: HomeModel) {
        movieType.text = model.title
        self.items = model.result
    }



    func configureConstrains() {
        contentView.addSubview(movieType)
        contentView.addSubview(button)
        contentView.addSubview(cellCollection)
        NSLayoutConstraint.activate([
            movieType.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieType.leadingAnchor
                .constraint(equalTo: contentView.leadingAnchor, constant: 32),
            button.topAnchor.constraint(equalTo: contentView.topAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cellCollection.topAnchor
                .constraint(equalTo: movieType.bottomAnchor, constant: 16),
            cellCollection.leadingAnchor
                .constraint(equalTo: contentView.leadingAnchor),
            cellCollection.trailingAnchor
                .constraint(equalTo: trailingAnchor),
            cellCollection.bottomAnchor
                .constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension HomeCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cellCollection.dequeueReusableCell(
            withReuseIdentifier: "LabelImageCell",
            for: indexPath
        ) as! LabelImageCell
        let model = items[indexPath.row]
        cell.configureCell(model: model)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 167, height: 272)
    }


}
