//
//  CharacterCollectionViewCell.swift
//  LocalJSON
//
//  Created by Michael Mecham on 8/2/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var idLabel: UILabel!
    @IBOutlet weak private var nameLabel: UILabel!
    
    func updateViewWithCharacter(character: Character) {
        configureCell()
        idLabel.text = character.id
        if !character.name.isEmpty {
            nameLabel.text = character.name
        } else if let alias = character.aliases.first where character.name.isEmpty {
            nameLabel.text = alias
        }
    }
    
    private func configureCell() {
        self.contentView.layer.borderWidth = 2
        self.contentView.layer.borderColor = UIColor.blackColor().CGColor
        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.masksToBounds = true
    }
    
}
