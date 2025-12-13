//
//  ActorVM.swift
//  MovieApp
//
//  Created by Ferid on 06.12.25.
//

import Foundation

class ActorVM {

    let manager = ActorManager()
//    let manager = ActorMockManager()


    var data: Actors?
    
    var items: [ActorResult] = []

    var success: (() -> Void)?
    var error: ((String) -> Void)?

    func getActors() {
        let page = (data?.page ?? 0) + 1
        print("current page \((data?.page ?? 0) + 1)")
        manager.getActors(page: page) { data, error in
            if let error = error {
                print(data ?? "")
                self.error?(error)
                print(String(describing: error))
            } else if let data = data {
                self.success?()
                self.data = data
                self.items.append(contentsOf: data.results ?? [])
                print(data)
            }
        }
    }

    func pagination(index: Int) {
        guard let page = data?.page else { return }
        guard let totalPages = data?.totalPages else { return }
        print(index)
        print(items.count)
        if page < totalPages && index == items.count - 2 {
            self.getActors()
        }
    }

    func reset() {
        data = nil
        items = []
        getActors()
    }
}
