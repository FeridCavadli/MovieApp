//
//  MovieController.swift
//  MovieApp
//
//  Created by Ferid on 12.12.25.
//

import UIKit

class MovieController: UIViewController {


    let vm: MovieVM
    init(vm: MovieVM) {
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
        collection
            .register(
                LabelImageCell.self,
                forCellWithReuseIdentifier: "LabelImageCell"
            )
        configureConstrains()
        configureViewModel()
        navigationItem.title = "Movies"
    }

    func configureConstrains() {
        view.addSubview(collection)
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.topAnchor),
            collection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor
                .constraint(equalTo: view.trailingAnchor)
        ])
    }

    func configureViewModel() {
        vm.getMovies()
        vm.error = { error in
            print(error)
        }
        vm.success = {
            self.collection.reloadData()
        }

    }
}

extension MovieController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.items.result.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(
            withReuseIdentifier: "LabelImageCell",
            for: indexPath) as! LabelImageCell
        let model = vm.items.result[indexPath.row]
        cell.configureCell(model: model)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collection.bounds.width - 45) / 2
        return .init(width: width, height: 272)
    }
}
