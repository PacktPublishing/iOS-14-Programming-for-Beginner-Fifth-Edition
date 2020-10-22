//
//  FilterManager.swift
//  LetsEat
//
//  Created by iOS 14 Programming on 16/10/2020.
//

import Foundation

class FilterManager:DataManager {
    func fetch(completionHandler:(_ items:[FilterItem]) -> Void) {
        var items:[FilterItem] = []
        for data in load(file: "FilterData") {
            items.append(FilterItem(dict: data))
        }
        completionHandler(items)
    }
}
