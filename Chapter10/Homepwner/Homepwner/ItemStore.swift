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
    
    init() {
        for _ in 0..<5 {
            createItem()
        }
    }

    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }

}
