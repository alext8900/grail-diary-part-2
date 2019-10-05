//
//  POIsTableViewController.swift
//  Grail Diary Part 1
//
//  Created by Alex Thompson on 9/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {
    
    @IBOutlet weak var POItableView: UITableView!
    
    var pois: [POI] = []

   override func viewDidLoad() {
        super.viewDidLoad()
    POItableView.delegate = self
    POItableView.dataSource = self 
        
}
    
        
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NextSegue" {
            if let addPOIVC = segue.destination as? AddPOIViewController {
                addPOIVC.delegate = self
            } else if segue.identifier == "ShowPOIDetailSegue" {
                if let indexPath = POItableView.indexPathForSelectedRow,
                    let detailVC = segue.destination as? POIDetailViewController {
                    detailVC.poi = pois[indexPath.row]
                }
            }
        }
    }
}
            
     
extension POIsTableViewController: UITableViewDelegate, UITableViewDataSource{
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        POItableView.reloadData()
    }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as?
            POITableViewCell else { return UITableViewCell() }
        
            
            let poi = pois[indexPath.row]
            cell.poi = poi
            return cell
    }

}

extension POIsTableViewController: addPOIDelegate {
    func poiWasCreated(_ poi: POI) {
        pois.append(poi)
        POItableView.reloadData()
        dismiss(animated: true, completion: nil)
        
        
    }
}



