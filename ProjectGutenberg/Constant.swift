//
//  Constant.swift
//  ProjectGutenberg
//
//  Created by Sourabh Kumbhar on 13/10/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import Foundation

import Foundation

class ConstantURL {
    static let baseURL = "http://skunkworks.ignitesol.com:8000/"
    static let booksUrl = "books?";
    
    static let baseImageURL = "https://image.tmdb.org/t/p/w500"
    static let apiKey = "be745ff0e61a927a93cf7b8ca3bdf7cc"
}

class ConstantKey {
    static let ok = "Ok"
    static let id = "id"
    static let title = "title"
    static let authors = "authors"
    static let name = "name"
    static let formats = "formats"
    static let imageJPEG = "image/jpeg"
    static let zip = "zip"
    static let applicationPDF = "application/pdf"
    static let textPlain = "text/plain; charset=us-ascii"
    static let textHTML = "text/html; charset=utf-8"
    static let noDataFound = "No data found ☹️"
    static let urlNotValid = "URL is not valid"
    static let error = "Error"
    static let fetchingData = "Fetching data"
    static let status = "status"
    static let data = "data"
    static let results = "results"
    static let description = "description"
    static let thumbnail = "thumbnail"
    static let path = "path"
    static let `extension` = "extension"
    static let somethingWentWrong = "Something went wrong"
    static let dataCannotConvert = "data cannot converted"
    static let na = "NA"
    static let noVersionAvailable = "No viewable version available"
    static let main = "Main"
    
}

class CollectionCellConstant {
    static let bookListCollectionViewCell = "bookListCollectionViewCell"
}

class ViewControllerIdentifierConstant {
    static let categoryVC = "categoryViewController"
    static let bookListVC = "bookListViewController"
}


class FontConstant {
    static let customSemiBoldFont = "Montserrat-SemiBold"
    static let regularFont = "Montserrat-Regular"
}
