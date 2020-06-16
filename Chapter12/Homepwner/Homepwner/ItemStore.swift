//
//  ItemStore.swift
//  Homepwner
//
//  Created by Eric Hyche on 8/25/19.
//  Copyright © 2019 Eric Hyche. All rights reserved.
//

import Foundation

class ItemStore {
    
    var allItems = [Item]()
    
//    init() {
//        for _ in 0..<5 {
//            createItem()
//        }
//    }

    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }

    func removeItem(_ item: Item) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        // Get reference to object being moved so you can reinsert it
        let movedItem = allItems[fromIndex]
        // Remove item from array
        allItems.remove(at: fromIndex)
        
        // Insert item in array at new location
        allItems.insert(movedItem, at: toIndex)
    }
}
