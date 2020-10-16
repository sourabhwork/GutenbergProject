//
//  CategoryViewController.swift
//  ProjectGutenberg
//
//  Created by Sourabh Kumbhar on 13/10/20.
//  Copyright © 2020 Sourabh Kumbhar. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var gutenbergLabel   : UILabel!
    @IBOutlet weak var projectLabel     : UILabel!
    @IBOutlet weak var projectInfoLabel : UILabel!
    @IBOutlet weak var fictionView      : UIView!
    @IBOutlet weak var dramaView        : UIView!
    @IBOutlet weak var humorView        : UIView!
    @IBOutlet weak var politicsView     : UIView!
    @IBOutlet weak var philosophyView   : UIView!
    @IBOutlet weak var historyView      : UIView!
    @IBOutlet weak var adventureView    : UIView!
    
    // Local variable
    private var currentCategoryEnum     = CategoryEnum.Fiction

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide navigation bar 
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: Setup UI
    private func setupUI() {
        setupRadius()
        setupShaddowToView()
        setupInteractionToView()
    }
    
    private func setupRadius() {
        fictionView.setRadius(radius: 4.0)
        dramaView.setRadius(radius: 4.0)
        humorView.setRadius(radius: 4.0)
        politicsView.setRadius(radius: 4.0)
        philosophyView.setRadius(radius: 4.0)
        historyView.setRadius(radius: 4.0)
        adventureView.setRadius(radius: 4.0)
    }
    
    private func setupShaddowToView() {
        fictionView.addShadowToView()
        dramaView.addShadowToView()
        humorView.addShadowToView()
        politicsView.addShadowToView()
        philosophyView.addShadowToView()
        historyView.addShadowToView()
        adventureView.addShadowToView()
    }
    
    private func setupInteractionToView() {
        fictionView.isUserInteractionEnabled = true
        dramaView.isUserInteractionEnabled = true
        humorView.isUserInteractionEnabled = true
        politicsView.isUserInteractionEnabled = true
        philosophyView.isUserInteractionEnabled = true
        historyView.isUserInteractionEnabled = true
        adventureView.isUserInteractionEnabled = true
        
        let fictionViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(fictionViewTapped))
        fictionViewTapGesture.numberOfTapsRequired = 1
        fictionView.addGestureRecognizer(fictionViewTapGesture)
        
        let dramaViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(dramaViewTapped))
        dramaViewTapGesture.numberOfTapsRequired = 1
        dramaView.addGestureRecognizer(dramaViewTapGesture)
        
        let humorViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(humorViewTapped))
        humorViewTapGesture.numberOfTapsRequired = 1
        humorView.addGestureRecognizer(humorViewTapGesture)
        
        let politicsViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(politicsViewTapped))
        politicsViewTapGesture.numberOfTapsRequired = 1
        politicsView.addGestureRecognizer(politicsViewTapGesture)
        
        let philosophyViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(philosophyViewTapped))
        philosophyViewTapGesture.numberOfTapsRequired = 1
        philosophyView.addGestureRecognizer(philosophyViewTapGesture)
        
        let historyViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(historyViewTapped))
        historyViewTapGesture.numberOfTapsRequired = 1
        historyView.addGestureRecognizer(historyViewTapGesture)
    }
    
    
    // MARK: Targets
    @objc func fictionViewTapped() {
        self.currentCategoryEnum = .Fiction
        navigateToNextVC()
    }
    
    @objc func dramaViewTapped() {
        self.currentCategoryEnum = .Drama
        navigateToNextVC()
    }
    
    @objc func humorViewTapped() {
        self.currentCategoryEnum = .Humor
        navigateToNextVC()
    }
    
    @objc func politicsViewTapped() {
        self.currentCategoryEnum = .Politics
        navigateToNextVC()
    }
    
    @objc func philosophyViewTapped() {
        self.currentCategoryEnum = .Philosophy
        navigateToNextVC()
    }
    
    @objc func historyViewTapped() {
        self.currentCategoryEnum = .History
        navigateToNextVC()
    }
    
    @objc func adventurViewTapped() {
        self.currentCategoryEnum = .Adventure
        navigateToNextVC()
    }

    private func navigateToNextVC() {
        let storyboard = UIStoryboard(name: ConstantKey.main, bundle: nil)
        if let bookListVC = storyboard.instantiateViewController(withIdentifier: ViewControllerIdentifierConstant.bookListVC) as? BookListViewController {
            bookListVC.categoryEnum = self.currentCategoryEnum
            self.navigationController?.pushViewController(bookListVC, animated: true)
        }
    }
}
