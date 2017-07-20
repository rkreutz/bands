//
//  BandsViewController.swift
//  Bands
//
//  Created by Rodrigo Kreutz on 21/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit
import Alamofire

class BandsViewController: UIViewController {
    /********************************/
    // MARK: - Static variables
    /********************************/
    static let detailSegueIdentifier = "showDetail"
    
    /********************************/
    // MARK: - Outlets
    /********************************/
    @IBOutlet weak var tableView: UITableView!
    
    /********************************/
    // MARK: - Instance variables
    /********************************/
    var bands: [Band] = []
    
    /********************************/
    // MARK: - UIViewController functions
    /********************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Remove insets from the table view
        self.automaticallyAdjustsScrollViewInsets = false
        
        // Table view configuration
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // Other configuration
        self.title = "Bands"
        
        // Load bands
        let jsonBands = Bundle.main.path(forResource: "bands", ofType: "json")
            .flatMap { path -> Data in
                return try! Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            }.flatMap { data -> [String: Any] in
                return try! JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String: Any]
            }
        
        guard let tmpBands = jsonBands?["bands"] as? [[String: String]] else {
            return
        }
        
        for dictBand in tmpBands {
            self.bands.append(Band(dict: dictBand))
        }
    }
    
    /********************************/
    // MARK: - Navigation
    /********************************/
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == BandsViewController.detailSegueIdentifier {
            guard let band = sender as? Band, let dstView = segue.destination as? DetailViewController else {
                return
            }
            
            dstView.band = band
        }
    }
    
}

