//
//  AddPOIViewController.swift
//  Grail Diary Part 1
//
//  Created by Alex Thompson on 9/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
protocol addPOIDelegate {
    func poiWasCreated(_ poi: POI)
}
class AddPOIViewController: UIViewController {
    
    
    
    @IBOutlet weak var locationTextView: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var clue1TextField: UITextField!
    @IBOutlet weak var clue2TextField: UITextField!
    @IBOutlet weak var clue3TextField: UITextField!
    
    
    
    
    var delegate: addPOIDelegate?
    override func viewDidLoad() {
      
        super.viewDidLoad()
    }
      @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
          dismiss(animated: true, completion: nil)
          }
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        guard let location = locationTextView.text,
            let country = countryTextField.text,
            !location.isEmpty,
            !country.isEmpty else {return}
        var poi = POI(location: location, country: country)
        
        if let clue1 = clue1TextField.text,
            !clue1.isEmpty {
            poi.clues.append(clue1)
        }
    
    if let clue2 = clue2TextField.text,
        !clue2.isEmpty {
        poi.clues.append(clue2)
    }
   
    if let clue3 = clue3TextField.text,
        !clue3.isEmpty {
        poi.clues.append(clue3)
    }
        //delegate?.poiWasCreated(poi)
        print(poi.clues)
        self.navigationController?.popViewController(animated: true)
        
    }
    

    
}
    
    extension AddPOIViewController: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if let text = textField.text,
                !text.isEmpty {
                switch textField {
                case locationTextView:
                    countryTextField.becomeFirstResponder()
                case countryTextField:
                    clue1TextField.becomeFirstResponder()
                case clue1TextField:
                    clue2TextField.becomeFirstResponder()
                case clue2TextField:
                    clue3TextField.becomeFirstResponder()
                default:
                    textField.resignFirstResponder()
                }
            }
            
            
            
            return false
        }
    }
    

