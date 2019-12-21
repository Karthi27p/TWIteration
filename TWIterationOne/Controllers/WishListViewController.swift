//
//  WishListViewController.swift
//  TWIterationOne
//
//  Created by Karthi on 21/12/19.
//  Copyright © 2019 Karthi. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension WishListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0) {
            guard let itemCell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as? WishListItemCellTableViewCell else {
                return UITableViewCell()
            }
            itemCell.configureItemCell()
            return itemCell
        
        } else {
            guard let totalCell = tableView.dequeueReusableCell(withIdentifier: "TotalCell") as? WishListTotalCell else {
                return UITableViewCell()
            }
            totalCell.configureTotalCell()
            return totalCell
        }
    }
    
}

extension WishListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
}
