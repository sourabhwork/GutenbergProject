//
//  NetworkServices.swift
//  ProjectGutenberg
//
//  Created by Sourabh Kumbhar on 14/10/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import Foundation


class NetworkServices {
    
    func fetchBooks(topic: String = "",searchText: String = "", completion: @escaping(_ success: Bool, _ message: String?, _ response: Array<Book>?)-> ()) {
        // Create url
        let urlString = ConstantURL.baseURL + ConstantURL.booksUrl + "topic=" + topic + "&search=" + searchText
        guard let url = URL(string: urlString) else {
            completion(false, ConstantKey.urlNotValid, nil)
            return
        }
        
        // Create url request
        var requst = URLRequest(url: url)
        
        // Set http method
        requst.httpMethod = "GET"
        
        // Create Session
        let session = URLSession.shared
        
        // Create datatask
        let dataTask = session.dataTask(with: requst, completionHandler: {
            (data, response, error)->Void in
            print("Data",data)
            print("Response", response)
            print("Error",error)
            if error != nil {
                completion(false, error?.localizedDescription, nil)
                return
            }
            if let convertData = data {
                do {
                    // Parsing data using JSONSerialization and pass data to viewcontroller through completion
                    
                    if let rootDictionary = try! JSONSerialization.jsonObject(with: convertData, options: .mutableContainers) as? NSDictionary {
                        print("Root dictionary == ",rootDictionary)
                        if let resultArray = rootDictionary.object(forKey: ConstantKey.results) as? NSArray {
                            var booksArray = Array<Book>()
                            for result in resultArray {
                                let book = Book()
                                if let resultDictionay = result as? NSDictionary {
                                    if let idInt = resultDictionay.object(forKey: ConstantKey.id) as? Int {
                                        book.id = idInt
                                    }
                                    if let titleString = resultDictionay.object(forKey: ConstantKey.title) as? String {
                                        book.title = titleString
                                    }
                                    if let authors = resultDictionay.object(forKey: ConstantKey.authors) as? NSArray {
                                        if authors.count > 0 {
                                            if let author = authors[0] as? NSDictionary {
                                                if let authornameString = author.object(forKey: ConstantKey.name) as? String {
                                                    book.author = authornameString
                                                }
                                            }
                                        }
                                    }
                                    if let formatDictionary = resultDictionay.object(forKey: ConstantKey.formats) as? NSDictionary {
                                        // Get image from response
                                        if let imageFormatString = formatDictionary.object(forKey: ConstantKey.imageJPEG) as? String {
                                            book.imageURL = imageFormatString
                                            booksArray.append(book)
                                            // Get browser url
                                            if let textPlainUrl = formatDictionary.object(forKey: ConstantKey.textPlain) as? String {
                                                if let url = URL(string: textPlainUrl)  {
                                                    if !url.lastPathComponent.contains(ConstantKey.zip) {
                                                        book.browserURL = textPlainUrl
                                                    }
                                                }
                                            }
                                            if let pdfUrl = formatDictionary.object(forKey: ConstantKey.applicationPDF) as? String {
                                                if let url = URL(string: pdfUrl) {
                                                    if !url.lastPathComponent.contains(ConstantKey.zip) {
                                                        book.browserURL = pdfUrl
                                                    }
                                                }
                                            }
                                            if let htmlUrl = formatDictionary.object(forKey: ConstantKey.textHTML) as? String{
                                                if let url = URL(string: htmlUrl) {
                                                    if !url.lastPathComponent.contains(ConstantKey.zip) {                                                        
                                                        book.browserURL = htmlUrl
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            completion(true, nil, booksArray)
                            return
                        }
                    }
                    
                } catch let error {
                    // Handle error
                    completion(false, error.localizedDescription, nil)
                    return
                }
            } else {
                // Handle error
                completion(false, ConstantKey.somethingWentWrong, nil)
                return
            }
        })
        dataTask.resume()
    }
}
