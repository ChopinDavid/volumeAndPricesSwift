//
//  String.swift
//  StackOverflowTest
//
//  Created by David G Chopin on 9/9/19.
//  Copyright © 2019 David G Chopin. All rights reserved.
//

import Foundation

extension String {
    func stringByRemovingAll(characters: [Character]) -> String {
        var stringToReturn = self
        for character in characters {
            stringToReturn = stringToReturn.replacingOccurrences(of: String(character), with: "")
        }
        return stringToReturn
    }
    
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}
