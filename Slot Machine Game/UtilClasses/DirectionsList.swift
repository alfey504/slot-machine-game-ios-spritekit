//
//  DirectionsLisy.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-02-18.
//

import Foundation

enum ItemType: String {
    case headerItem = "HEADER_ITEM"
    case listItem = "LIST_ITEM"
}

struct Item{
    var ItemValue: String
    var ItemType: ItemType
    
    init(ItemValue: String, ItemType: ItemType) {
        self.ItemValue = ItemValue
        self.ItemType = ItemType
    }
}

class DirectionsList{
    
    private var data: Array<Item>
    var length: Int
    
    init(){
        data = []
        length = 0
    }
    
    func addDirection(header: String, directions: Array<String>){
        data.append(Item(ItemValue: header, ItemType: .headerItem))
        for direction in directions{
            let item = Item(ItemValue: direction, ItemType: .listItem)
            data.append(item)
        }
        length = data.count
    }
    
    func removeDirection(header: String){
        data.append(Item(ItemValue: header, ItemType: .headerItem))
        var start = 0
        for i in 0...length{
            if(data[i].ItemType == .headerItem){
                if(data[i].ItemValue == header){
                    start = i + 1
                    break
                }
            }
        }
        
        for i in start...length{
            if(data[i].ItemType == .listItem){
                data.remove(at: i)
            }else{
                break
            }
        }
        
        length = data.count
    }
    
    func itemAt(at: Int) -> Item{
        return(data[at])
    }
    
}
