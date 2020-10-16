//
//  Book.swift
//  ProjectGutenberg
//
//  Created by Sourabh Kumbhar on 15/10/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import Foundation

//class BookResponse: Codable {
//    let count: Int
//    let next: String
//    let previous: JSONNull?
//    let results: [Book]
//
//    init(count: Int, next: String, previous: JSONNull?, results: [Book]) {
//        self.count = count
//        self.next = next
//        self.previous = previous
//        self.results = results
//    }
//}
//
//// MARK: - Result
//class Book: Codable {
//    let id: Int
//    let authors: [Author]?
//    let bookshelves: [String]
//    let downloadCount: Int
//    let formats: Formats?
//    let languages: [Language]
//    let mediaType: MediaType
//    let subjects: [String]
//    let title: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id, authors, bookshelves
//        case downloadCount = "download_count"
//        case formats, languages
//        case mediaType = "media_type"
//        case subjects, title
//    }
//
//    init(id: Int, authors: [Author], bookshelves: [String], downloadCount: Int, formats: Formats, languages: [Language], mediaType: MediaType, subjects: [String], title: String) {
//        self.id = id
//        self.authors = authors
//        self.bookshelves = bookshelves
//        self.downloadCount = downloadCount
//        self.formats = formats
//        self.languages = languages
//        self.mediaType = mediaType
//        self.subjects = subjects
//        self.title = title
//    }
//}
//
//// MARK: - Author
//class Author: Codable {
//    let birthYear, deathYear: Int?
//    let name: String
//
//    enum CodingKeys: String, CodingKey {
//        case birthYear = "birth_year"
//        case deathYear = "death_year"
//        case name
//    }
//
//    init(birthYear: Int, deathYear: Int, name: String) {
//        self.birthYear = birthYear
//        self.deathYear = deathYear
//        self.name = name
//    }
//}
//
//// MARK: - Formats
//class Formats: Codable {
//    let applicationXMobipocketEbook: String
//    let textPlainCharsetUTF8: String?
//    let applicationRDFXML: String
//    let textPlainCharsetISO88591: String?
//    let applicationEpubZip: String
//    let imageJPEG: String?
//    let textHTMLCharsetUTF8: String?
//    let applicationPDF: String?
//    let textPlainCharsetUsASCII: String?
//    let applicationZip: String?
//    let textPlain: String?
//    let textHTMLCharsetISO88591: String?
//    let textHTMLCharsetUsASCII: String?
//    let textHTML: String?
//
//    enum CodingKeys: String, CodingKey {
//        case applicationXMobipocketEbook = "application/x-mobipocket-ebook"
//        case textPlainCharsetUTF8 = "text/plain; charset=utf-8"
//        case applicationRDFXML = "application/rdf+xml"
//        case textPlainCharsetISO88591 = "text/plain; charset=iso-8859-1"
//        case applicationEpubZip = "application/epub+zip"
//        case imageJPEG = "image/jpeg"
//        case textHTMLCharsetUTF8 = "text/html; charset=utf-8"
//        case applicationPDF = "application/pdf"
//        case textPlainCharsetUsASCII = "text/plain; charset=us-ascii"
//        case applicationZip = "application/zip"
//        case textPlain = "text/plain"
//        case textHTMLCharsetISO88591 = "text/html; charset=iso-8859-1"
//        case textHTMLCharsetUsASCII = "text/html; charset=us-ascii"
//        case textHTML = "text/html"
//    }
//
//    init(applicationXMobipocketEbook: String, textPlainCharsetUTF8: String?, applicationRDFXML: String, textPlainCharsetISO88591: String?, applicationEpubZip: String, imageJPEG: String?, textHTMLCharsetUTF8: String?, applicationPDF: String?, textPlainCharsetUsASCII: String?, applicationZip: String?, textPlain: String?, textHTMLCharsetISO88591: String?, textHTMLCharsetUsASCII: String?, textHTML: String?) {
//        self.applicationXMobipocketEbook = applicationXMobipocketEbook
//        self.textPlainCharsetUTF8 = textPlainCharsetUTF8
//        self.applicationRDFXML = applicationRDFXML
//        self.textPlainCharsetISO88591 = textPlainCharsetISO88591
//        self.applicationEpubZip = applicationEpubZip
//        self.imageJPEG = imageJPEG
//        self.textHTMLCharsetUTF8 = textHTMLCharsetUTF8
//        self.applicationPDF = applicationPDF
//        self.textPlainCharsetUsASCII = textPlainCharsetUsASCII
//        self.applicationZip = applicationZip
//        self.textPlain = textPlain
//        self.textHTMLCharsetISO88591 = textHTMLCharsetISO88591
//        self.textHTMLCharsetUsASCII = textHTMLCharsetUsASCII
//        self.textHTML = textHTML
//    }
//}
//
//enum Language: String, Codable {
//    case en = "en"
//}
//
//enum MediaType: String, Codable {
//    case text = "Text"
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}

class Book {
    var id          : Int?
    var title       : String?
    var author      : String?
    var imageURL    : String?
    var browserURL  : String?
}
