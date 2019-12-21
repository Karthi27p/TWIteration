//
//  ProductListCellTableViewCell.swift
//  TWIterationOne
//
//  Created by Karthi on 20/12/19.
//  Copyright © 2019 Karthi. All rights reserved.
//

import UIKit

class ProductListCellTableViewCell: UITableViewCell {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    var pid : String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(cellVM: ViewModel) {
        self.nameLabel.text = cellVM.productName
        self.priceLabel.text = cellVM.productPrice
        self.priceLabel.textColor = cellVM.color
        self.stepper.autorepeat = true
        self.stepper.wraps = true
        self.countLabel.text = getCount()
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let count = Int(sender.value).description
        let id = self.pid!
        
        UserDefaults.standard.set(Int(count), forKey: id)
        UserDefaults.standard.synchronize()
        
        let result = UserDefaults.standard.integer(forKey: id)
        self.countLabel.text = "("+String(result)+")"
        
    }
    
    func getCount() -> String {
        let id = self.pid!
        let result = UserDefaults.standard.integer(forKey: id)
        return "("+String(result)+")"
    }
   
}
