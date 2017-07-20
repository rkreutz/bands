//
//  DetailViewController.swift
//  Bands
//
//  Created by Rodrigo Kreutz on 21/12/16.
//  Copyright © 2016 Rodrigo Kreutz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    /********************************/
    // MARK: - Static variables
    /********************************/
    
    /********************************/
    // MARK: - Outlets
    /********************************/
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var bandName: UILabel!
    @IBOutlet weak var bandGenre: UILabel!
    @IBOutlet weak var bandCountry: UILabel!
    @IBOutlet weak var flagImage: RoundedImageView!
    @IBOutlet weak var bandWebsite: UILabel!
    
    /********************************/
    // MARK: - Instance variables
    /********************************/
    var band: Band!
    
    /********************************/
    // MARK: - UIViewController functions
    /********************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backgroundImage.loadImage(fromUrl: self.band.image, identifier: "background\(self.band.id)")
        self.bandName.text = self.band.name
        self.bandGenre.text = self.band.genre
        self.bandCountry.text = self.band.country
        self.flagImage.loadImage(fromUrl: self.band.countryFlag, identifier: "flag\(self.band.id)")
        self.bandWebsite.text = self.band.website
    }
}
