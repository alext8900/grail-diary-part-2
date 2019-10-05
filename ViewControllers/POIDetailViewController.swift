//
//  POIDetailViewController.swift
//  Grail Diary Part 1
//
//  Created by Alex Thompson on 9/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {
    var poi: POI? {
        didSet {
            updateViews()
        }
    }
    func updateViews() {
        
    }
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
