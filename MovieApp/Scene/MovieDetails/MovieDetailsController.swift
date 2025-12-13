//
//  MovieDetailsController.swift
//  MovieApp
//
//  Created by Ferid on 11.12.25.
//

import UIKit

class MovieDetailsController: UIViewController {

    let vm: MovieDetailsVM
    init(vm: MovieDetailsVM) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var collection: UICollectionView = {
        let l = UICollectionViewFlowLayout()
        l.scrollDirection = .vertical
        l.minimumLineSpacing = 15
        l.minimumInteritemSpacing = 15
        l.sectionInset = .init(top: 0, left: 15, bottom: 0, right: 15)
        let c = UICollectionView(frame: .zero, collectionViewLayout: l)
        c.translatesAutoresizingMaskIntoConstraints = false
        return c
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
        collection.register(MovieDetailCell.self, forCellWithReuseIdentifier: "MovieDetailCell")
        configureViewModel()
        configureConstraints()
    }

    func configureViewModel() {
        vm.getMovieDetails()
        vm.success = {
            self.collection.reloadData()
        }
        vm.error = { errorMessage in
            print(errorMessage)
        }
    }

    func configureConstraints() {
        view.addSubview(collection)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.topAnchor),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor
                .constraint(equalTo: view.trailingAnchor)
        ])
    }


}
extension MovieDetailsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(
            withReuseIdentifier: "MovieDetailCell",
            for: indexPath
        ) as! MovieDetailCell
        guard let model = vm.items else { return cell}
        cell.configureCell(model: model)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collection.frame.width
        let height = collection.frame.height
        return .init(width: width, height: height)
    }
}
