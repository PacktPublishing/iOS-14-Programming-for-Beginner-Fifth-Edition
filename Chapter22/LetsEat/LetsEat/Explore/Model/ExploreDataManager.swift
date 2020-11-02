//
//  ExploreDataManager.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 27/10/2020.
//

import Foundation

class ExploreDataManager: DataManager {
    
    fileprivate var items:[ExploreItem] = []
    
    func fetch() {
        for data in load(file: "ExploreData")  {
            items.append(ExploreItem(dict: data))
        }
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func explore(at index:IndexPath) -> ExploreItem {
        items[index.item]
    }
}
