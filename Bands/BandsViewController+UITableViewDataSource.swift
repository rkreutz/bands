//
//  BandsViewController+UITableViewDataSource.swift
//  Bands
//
//  Created by Rodrigo Kreutz on 21/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit

let colors = [
    UIColor(red: 36.0/255.0, green: 14.0/255.0, blue: 15.0/255.0, alpha: 1.0),
    UIColor(red: 45.0/255.0, green: 30.0/255.0, blue: 38.0/255.0, alpha: 1.0),
    UIColor(red: 24.0/255.0, green: 14.0/255.0, blue: 21.0/255.0, alpha: 1.0),
    UIColor(red: 74.0/255.0, green: 50.0/255.0, blue: 71.0/255.0, alpha: 1.0),
    UIColor(red: 51.0/255.0, green: 48.0/255.0, blue: 84.0/255.0, alpha: 1.0)
]

extension BandsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BandTableViewCell.cellIdentifier, for: indexPath) as! BandTableViewCell
        
        cell.titleLabel.text = self.bands[indexPath.row].name
        cell.backgroundColor = colors[indexPath.row % 5]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bands.count
    }
    
}
