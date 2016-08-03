//
//  Character Controller.swift
//  LocalJSON
//
//  Created by Michael Mecham on 8/2/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import Foundation

let CharacterNotificationCompleteKey = "charactersCompleted"

struct CharacterController {
    
    static let sharedController = CharacterController()
    
    private(set) var charactersArray = [Character]() {
        didSet {
            let nc = NSNotificationCenter.defaultCenter()
            nc.postNotificationName(CharacterNotificationCompleteKey, object: nil)
        }
    }
    
    init() {
        getCharacters()
    }
    
    private mutating func getCharacters() {
        guard let filePath = NSBundle.mainBundle().pathForResource("thrones", ofType: "json"),
        data = NSData(contentsOfFile: filePath),
        jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [[String:AnyObject]] else { return }
        let characters = jsonDictionary.flatMap { Character(dictionary: $0) }
        charactersArray = characters
    }
}