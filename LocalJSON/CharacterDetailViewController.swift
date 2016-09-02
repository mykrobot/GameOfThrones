//
//  CharacterDetailViewController.swift
//  LocalJSON
//
//  Created by Michael Mecham on 8/2/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//
import UIKit

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var idLabel: UILabel!
    @IBOutlet weak private var genderLabel: UILabel!
    @IBOutlet weak private var cultureLabel: UILabel!
    @IBOutlet weak private var bornLabel: UILabel!
    @IBOutlet weak private var diedLabel: UILabel!
    @IBOutlet weak private var titlesLabel: UILabel!
    @IBOutlet weak private var aliasesLabel: UILabel!
    @IBOutlet weak private var fatherLabel: UILabel!
    @IBOutlet weak private var motherLabel: UILabel!
    @IBOutlet weak private var spouseLabel: UILabel!
    @IBOutlet weak private var allegiancesLabel: UILabel!
    @IBOutlet weak private var booksLabel: UILabel!
    @IBOutlet weak private var povBooksLabel: UILabel!
    @IBOutlet weak private var tvSeriesLabel: UILabel!
    @IBOutlet weak private var playedByLabel: UILabel!
    
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let character = character {
            updateViewsWith(character)
        }
    }
    
    private func updateViewsWith(character: Character) {
        nameLabel.text = character.name
        idLabel.text = character.id
        genderLabel.text = character.gender
        cultureLabel.text = "Culture: \(character.culture)"
        bornLabel.text = "Born: \(character.born)"
        diedLabel.text = "Died: \(character.died)"
        titlesLabel.text = character.titles.joinWithSeparator(", ")
        aliasesLabel.text = character.aliases.joinWithSeparator(", ")
        fatherLabel.text = "Father: \(character.father)"
        motherLabel.text = "Mother: \(character.mother)"
        spouseLabel.text = "Spouse: \(character.spouse)"
        allegiancesLabel.text = "Allegiances: \(character.allegiances.joinWithSeparator(", "))"
        booksLabel.text = "Books: \(character.books.joinWithSeparator(", "))"
        povBooksLabel.text = "pov Books: \(character.povBooks.joinWithSeparator(", "))"
        tvSeriesLabel.text = "TV Series: \(character.tvSeries.joinWithSeparator(", "))"
        playedByLabel.text = "Played by: \(character.playedBy.joinWithSeparator(", "))"
    }
    
    
}
