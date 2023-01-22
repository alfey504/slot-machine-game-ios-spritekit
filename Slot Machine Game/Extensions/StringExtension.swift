//
//  StringExtension.swift
//  Slot Machine Game
//
//  Created by Abraham Alfred Babu on 2023-01-21.
//

import Foundation

extension String {
    
    func numberOfChars(char: Character) -> Int{
        var count = 0
        for c in self{
            if c == char{
                count += 1
            }
        }
        return count
    }
    
    func isNumber() -> Bool {
        let digitsCharacters = CharacterSet(charactersIn: "0123456789.")
        if(CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)){
            if(self.numberOfChars(char: ".") > 1){
                return(false)
            }else{
                return(true)
            }
        }else{
            return(false)
        }
    }
}
