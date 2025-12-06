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
        l.minimumLineSpacing = 30
        l.minimumInteritemSpacing = 0
        let c = UICollectionView(frame: .zero, collectionViewLayout: l)
        c.translatesAutoresizingMaskIntoConstraints = false
        return c
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
