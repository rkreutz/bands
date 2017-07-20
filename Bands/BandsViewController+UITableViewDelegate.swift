//
//  BandsViewController+UITableViewDelegate.swift
//  Bands
//
//  Created by Rodrigo Kreutz on 21/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit
import Alamofire

extension BandsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? BandTableViewCell {
            let band = self.bands[indexPath.row]
            
            if let dictBand = UserDefaults.standard.dictionary(forKey: band.id) as? [String: String] {
                let storedBand = Band(dict: dictBand)
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: BandsViewController.detailSegueIdentifier, sender: storedBand)
                }
                return
            }
            
            // Disables any interaction which may lead to another request
            tableView.allowsSelection = false
            
            // Indicates the cell information is beeing loaded
            cell.activityIndicator.startAnimating()
            
            RequestManager.fetchBandDetails(id: band.id) { (band: Band?, errorMsg: String?) in
                DispatchQueue.main.async {
                    // We enable all interactions
                    tableView.allowsSelection = true

                    // And stop the indicator for the cell detail
                    cell.activityIndicator.stopAnimating()
                }

                // If there were no errors we shall proceed to the detail view
                // Otherwise we present the error to the user
                if let errorMsg = errorMsg {
                    let alert = UIAlertController(title: "Erro", message: errorMsg, preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(ok)

                    DispatchQueue.main.async {
                        self.present(alert, animated: true, completion: nil)
                    }
                } else {
                    UserDefaults.standard.set(band!.toDict(), forKey: band!.id)
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: BandsViewController.detailSegueIdentifier, sender: band)
                    }
                }
            }
        }
    }
    
}
