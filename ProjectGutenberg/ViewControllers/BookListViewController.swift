//
//  BookListViewController.swift
//  ProjectGutenberg
//
//  Created by Sourabh Kumbhar on 14/10/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var searchBar        : UISearchBar!
    @IBOutlet weak var collectionView   : UICollectionView!
    
    // MARK: Local variables
    private var progressHud             : ProgressHUD?
    private var bookArray               = Array<Book>()
    internal var categoryEnum           = CategoryEnum.Fiction
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Setup UI
    private func setupUI() {
        setupNavigationBar()
        setupSearchBar()
        setupCollectionView()
        self.callForBookResponse()
    }
    
    private func setupNavigationBar() {
        self.title = categoryEnum.description
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: MontserratEnum.SemiBold.size(size: 30), NSAttributedString.Key.foregroundColor: ColorEnum.CustomPurple.getColor()]        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.smartInsertDeleteType = .no
        searchBar.isTranslucent = false
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.searchTextField.font = MontserratEnum.Regular.size(size: 16)
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundView = getCollectionViewBackgroundLabel()
    }
    
    private func setupProgressView() {
        progressHud = ProgressHUD(text: ConstantKey.fetchingData)
        self.view.addSubview(progressHud!)
    }
    
    // MARK: Network call
    private func callForBookResponse(searchString: String = "") {
        self.setupProgressView()
        let networkServices = NetworkServices()
        // Call for geting books
        networkServices.fetchBooks(topic: categoryEnum.description, searchText: searchString,completion: {
            (isSucess, message, bookresponse) in
            // Success response validation
            if isSucess {
                // Handle view in main thread
                DispatchQueue.main.async {
                    self.progressHud?.hide()
                }
                if let books = bookresponse {
                    // Set books response to local variable
                    self.bookArray = books
                    // Handle views in main thread
                    DispatchQueue.main.async {
                        self.progressHud?.hide()
                        self.collectionView.reloadData()
                    }
                }
            } else {
                // Error response validation
                DispatchQueue.main.async {
                    self.progressHud?.hide()
                    self.showAlert(title: ConstantKey.error, message: message ?? ConstantKey.error)
                }
            }
        })
    }

}

//  MARK:- Collection Delegates and DataSource

extension BookListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Check condition for array empty whic is no data found label show
        if bookArray.count == 0 {
            collectionView.backgroundView?.isHidden = false
        } else  {
            collectionView.backgroundView?.isHidden = true
        }
        return bookArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCellConstant.bookListCollectionViewCell, for: indexPath) as! BookListCollectionViewCell
        // Condition check for array index out of bound
        if indexPath.row < bookArray.count {
            let book = bookArray[indexPath.row]
            // Set data to cell
            cell.configureCell(book: book)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Condition check for array index out of bound
        if indexPath.row < bookArray.count {
            let book = bookArray[indexPath.row]
            // Check condition for browser url is exist or not
            if let browserURL = book.browserURL {
                if let url = URL(string: browserURL) {
                    // Open browser
                    UIApplication.shared.open(url)
                } else {
                    // Error alert
                    self.showAlert(title: ConstantKey.error, message: ConstantKey.noVersionAvailable)
                }
            } else {
                // Error alert
                self.showAlert(title: ConstantKey.error, message: ConstantKey.noVersionAvailable)
            }
        }
    }
}

// MARK:- SearchBar Delegate and Datasource

extension BookListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Call api when enter text in searchbar
        callForBookResponse(searchString: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        resignFirstResponder()
        self.view.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
