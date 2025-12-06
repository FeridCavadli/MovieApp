//
//  HomeController.swift
//  MovieApp
//
//  Created by Ferid on 30.11.25.
//

import UIKit

class HomeController: UIViewController {

    var collection: UICollectionView = {
        let l = UICollectionViewFlowLayout()
        l.scrollDirection = .vertical
        l.minimumLineSpacing = 30
        l.minimumInteritemSpacing = 0
        let c = UICollectionView(frame: .zero, collectionViewLayout: l)
        c.translatesAutoresizingMaskIntoConstraints = false
        return c
    }()


    let viewModel = HomeVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collection.delegate = self
        collection.dataSource = self
        collection.register(HomeCell.self, forCellWithReuseIdentifier: "HomeCell")
        configureConstrains()
        configureViewModel()
        navigationItem.title = "Home"
    }

    func configureViewModel() {
        viewModel.getMovies()
        viewModel.success = {
            self.collection.reloadData()
        }
        viewModel.error = { errorMessage in
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

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(
            withReuseIdentifier: "HomeCell",
            for: indexPath
        ) as! HomeCell
        
        let model = viewModel.items[indexPath.row]
        cell.configureCell(model: model)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collection.bounds.width
        return .init(width: width, height: 318)
    }
}
