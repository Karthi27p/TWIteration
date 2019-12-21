//
//  WishListTotalCell.swift
//  TWIterationOne
//
//  Created by Karthi on 21/12/19.
//  Copyright © 2019 Karthi. All rights reserved.
//

import UIKit

class WishListTotalCell: UITableViewCell {

    @IBOutlet weak var totalValue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureTotalCell() {
        self.totalValue.text = "$250"
    }

}
