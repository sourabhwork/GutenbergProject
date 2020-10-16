//
//  BookListCollectionViewCell.swift
//  ProjectGutenberg
//
//  Created by Sourabh Kumbhar on 14/10/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import UIKit

class BookListCollectionViewCell: UICollectionViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var bookImageView    : UIImageView!
    @IBOutlet weak var bookNameLabel    : UILabel!
    @IBOutlet weak var authorNameLabel  : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        self.bookImageView.setRadius(radius: 8.0)
    }
    
    func configureCell(book: Book) {
        // Clear data for views
        bookImageView.image = nil
        bookNameLabel.text = ""
        authorNameLabel.text = ""
        
        // Set data to views 
        if let title = book.title {
            bookNameLabel.text = title
        }
        if let author = book.author {
            authorNameLabel.text = author
        }
        if let imageStringURL = book.imageURL {
            bookImageView.downloaded(from: imageStringURL, contentMode: .scaleAspectFill)
        }
    }
}
