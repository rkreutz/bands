//
//  BandTableViewCell.swift
//  Bands
//
//  Created by Rodrigo Kreutz on 21/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit

class BandTableViewCell: UITableViewCell {
    /********************************/
    // MARK: - Static variables
    /********************************/
    static let cellIdentifier = "bandCell"
    
    /********************************/
    // MARK: - Outlets
    /********************************/
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    /********************************/
    // MARK: - UITableViewCell functions
    /********************************/
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.setSelected(false, animated: true)
        }
    }
    
}
