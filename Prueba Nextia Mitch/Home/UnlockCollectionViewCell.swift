//
//  UnlockCollectionViewCell.swift
//  Prueba Nextia Mitch
//
//  Created by Mitch Samaniego on 30/11/20.
//

import UIKit
import SDWebImage

class UnlockCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var lockedImage: UIImageView!
    @IBOutlet var logo: UIImageView!
    @IBOutlet var viewHeader: UIView!
    @IBOutlet var descount: UILabel!
    @IBOutlet var cad: UILabel!
    @IBOutlet var territory: UILabel!
    @IBOutlet var buttonLocked: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func renderRow(benefit: Benefit) {
        
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true

        
        self.layer.masksToBounds = false
        
        
        if benefit.status == "locked"{

            lockedImage.isHidden = false
            buttonLocked.isHidden = false

            lockedImage.sd_setImage(with: URL(string: benefit.vector_full_path!))
            
            descount.isHidden = true
            viewHeader.isHidden = true
            territory.isHidden = true
            cad.isHidden = true
            logo.isHidden = true
        } else {
            descount.text = benefit.title
            viewHeader.backgroundColor = UIColor(hex: benefit.primary_color!+"ff")
            var territoriesString = ""
            var counting = 0
            benefit.territories?.forEach({ (territory) in
                counting += 1
                territoriesString += "\(String(describing: territory.name!))"
                if counting != benefit.territories?.count{
                    territoriesString += ", "
                }
            })
            territory.text = territoriesString
            cad.text = "Expira el \(String(describing: benefit.expiration_date!))"
            logo.sd_setImage(with: URL(string: (benefit.ally?.mini_logo_full_path!)!))
            
            descount.isHidden = false
            viewHeader.isHidden = false
            territory.isHidden = false
            cad.isHidden = false
            logo.isHidden = false
            
            lockedImage.isHidden = true
            buttonLocked.isHidden = true
        }
        
    }
    
    @IBAction func unlockBenefits(_ sender: Any) {
        
        descount.isHidden = false
        viewHeader.isHidden = false
        territory.isHidden = false
        cad.isHidden = false
        logo.isHidden = false
        
        lockedImage.isHidden = true
        buttonLocked.isHidden = true
        
    }
    

}

