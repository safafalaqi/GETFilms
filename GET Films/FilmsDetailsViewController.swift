//
//  FilmsDetailsViewController.swift
//  GET Films
//
//  Created by Safa Falaqi on 23/12/2021.
//

import UIKit

class FilmsDetailsViewController: UIViewController {
    
    var film:FilmsResult?
    
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var openingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        releaseLabel.text =  film?.releaseDate
        titleLabel.text = film?.title
        directorLabel.text = film?.director
        openingLabel.text = film?.openingCrawl
        
    }
    

 

}
