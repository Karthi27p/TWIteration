//
//  ViewController.swift
//  TWIterationOne
//
//  Created by Karthi on 20/12/19.
//  Copyright © 2019 Karthi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model: [Model]?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let apiService = ApiService()
        apiService.loadJson(filename:"SampleJson") { (resultModel, error) in
            self.model = resultModel as? [Model]
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let productListCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? ProductListCellTableViewCell else {
            return UITableViewCell()
        }
        let cellViewModel = ViewModel()
        cellViewModel.model = model?[indexPath.row]
        productListCell.nameLabel.text = cellViewModel.productName
        productListCell.priceLabel.text = cellViewModel.productPrice
        productListCell.productImage.image = UIImage(named: "product-image")
        return productListCell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
