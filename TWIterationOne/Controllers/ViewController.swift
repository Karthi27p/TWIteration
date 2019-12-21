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
        
        let url = URL(string: "http://www.mocky.io/v2/5dfb59e72f00006200ff9e80")
        let urlRequest = URLRequest(url: url!)
        self.tableView.estimatedRowHeight = 120.0
        self.tabBarController?.delegate = self as? UITabBarControllerDelegate
        self.tableView.rowHeight = UITableView.automaticDimension
        ApiService.getDataFromApi(requestUrl: urlRequest, resultStruct: [Model].self) { [weak self] (resultModel, error) in
            DispatchQueue.main.async {
                self?.model = resultModel as? [Model]
                self?.tableView.reloadData()
            }
        }
        
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
        productListCell.pid = cellViewModel.productId
        productListCell.configureCell(cellVM: cellViewModel)
        cellViewModel.model?.setImage(completion: { (image) in
            productListCell.productImage.image = image
        })
        
        
        return productListCell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

extension ViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Test")
    }
}
