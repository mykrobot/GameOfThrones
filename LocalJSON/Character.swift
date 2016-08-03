//
//  Character.swift
//  LocalJSON
//
//  Created by Michael Mecham on 8/2/16.
//  Copyright © 2016 MichaelMecham. All rights reserved.
//
import Foundation

struct Character {
    
    private let IDKey = "id"
    private let NameKey = "name"
    private let GenderKey = "gender"
    private let CultureKey = "culture"
    private let BornKey = "born"
    private let DiedKey = "died"
    private let TitlesKey = "titles"
    private let AliasesKey = "aliases"
    private let FatherKey = "father"
    private let MotherKey = "mother"
    private let SpouseKey = "spouse"
    private let AllegiancesKey = "allegiances"
    private let BooksKey = "books"
    private let PovBooksKey = "povBooks"
    private let TVSeriesKey = "tvSeries"
    private let PlayedByKey = "playedBy"
    
    let name: String
    let id: String
    let gender: String
    let culture: String
    let born: String
    let died: String
    let titles: [String]
    let aliases: [String]
    let father: String
    let mother: String
    let spouse: String
    let allegiances: [String]
    let books: [String]
    let povBooks: [String]
    let tvSeries: [String]
    let playedBy: [String]
}

extension Character {
    
    init?(dictionary: [String:AnyObject]) {
        guard let id = dictionary[IDKey] as? String,
        name = dictionary[NameKey] as? String,
        gender = dictionary[GenderKey] as? String,
        culture = dictionary[CultureKey] as? String,
        born = dictionary[BornKey] as? String,
        died = dictionary[DiedKey] as? String,
        titles = dictionary[TitlesKey] as? [String],
        aliases = dictionary[AliasesKey] as? [String],
        father = dictionary[FatherKey] as? String,
        mother = dictionary[MotherKey] as? String,
        spouse = dictionary[SpouseKey] as? String,
        allegiances = dictionary[AllegiancesKey] as? [String],
        books = dictionary[BooksKey] as? [String],
        povBooks = dictionary[PovBooksKey] as? [String],
        tvSeries = dictionary[TVSeriesKey] as? [String],
        playedBy = dictionary[PlayedByKey] as? [String] else { return nil }
        
        self.name = name
        self.id = id
        self.gender = gender
        self.culture = culture
        self.born = born
        self.died = died
        self.titles = titles
        self.aliases = aliases
        self.father = father
        self.mother = mother
        self.spouse = spouse
        self.allegiances = allegiances
        self.books = books
        self.povBooks = povBooks
        self.tvSeries = tvSeries
        self.playedBy = playedBy
    }
}