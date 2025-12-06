//
//  ActorController.swift
//  MovieApp
//
//  Created by Ferid on 06.12.25.
//

import UIKit

class ActorController: UIViewController {

    let vm = ActorVM()
    
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
        collection.delegate = self
        collection.dataSource = self
        collection
            .register(
                LabelImageCell.self,
                forCellWithReuseIdentifier: "LabelImageCell"
            )
        configureConstrains()
        configureViewModel()
        navigationItem.title = "Actors"
    }

    func configureViewModel() {
        vm.getActors()
        vm.success = {
            self.collection.reloadData()
        }
        vm.error = { errorMessage in
            print(errorMessage)
        }
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
}

extension ActorController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        vm.items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(
            withReuseIdentifier: "LabelImageCell",
            for: indexPath
        ) as! LabelImageCell
        let model = vm.items[indexPath.row]
        cell.configureCell(model: model)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collection.bounds.width - 45) / 2
        return .init(width: width, height: 272)
    }
}
