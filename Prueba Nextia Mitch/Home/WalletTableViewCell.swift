//
//  WalletTableViewCell.swift
//  Prueba Nextia Mitch
//
//  Created by Mitch Samaniego on 30/11/20.
//

import UIKit

class WalletTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var walletName: UILabel!
    @IBOutlet var benefitCell: UICollectionView!
    
    var ordenedBenefit: OrdenedBenefit = OrdenedBenefit(wallet: Wallet(id: 1, display_index: 0, display_text: "", icon: "", path: "", max_level: 0, avatar: "", name: "", benevit_count: 0, mobile_cover_url: "", desktop_cover_url: "", primary_color: ""), benefits: [])
    var benefits: [Benefit] = []
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        benefitCell.register(UINib(nibName: "UnlockCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell_unlock")
        benefitCell.delegate = self
        benefitCell.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func renderCell( ordenedBenefit: OrdenedBenefit ) {
        self.ordenedBenefit = ordenedBenefit
        walletName.text = self.ordenedBenefit.wallet.name
        benefitCell.reloadData()
    }
    
    //MARK:-- collection view implementations
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ordenedBenefit.benefits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : UnlockCollectionViewCell = benefitCell.dequeueReusableCell(withReuseIdentifier: "cell_unlock", for: indexPath) as! UnlockCollectionViewCell
        cell.renderRow(benefit: ordenedBenefit.benefits[indexPath.row])
        return cell
        
        
        
    }
}
