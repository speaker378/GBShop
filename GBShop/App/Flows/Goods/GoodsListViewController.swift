//
//  GoodsListViewController.swift
//  GBShop
//
//  Created by Сергей Черных on 06.06.2022.
//

import UIKit

final class GoodsListViewController: UITableViewController {
    
    lazy var goodsListDataService: GoodsListRequestFactory = {
        return RequestFactory().makeGoodsList()
    }()
    
    private var goods: [GoodsListItem] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGoodsList()
    }
    
    private func fetchGoodsList() {
        goodsListDataService.catalog(requestModel: GoodsListRequest(pageNumber: 1, categoryId: 1)) { [unowned self] response in
            switch response.result {
            case .success(let result):
                if result.result == 1 {
                    self.goods = result.products ?? []
                } else {
                    print(result.errorMessage ?? "")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = GoodsTableViewCell(style: .default, reuseIdentifier: "GoodsTableViewCell")
        cell.configure(goods[indexPath.row])
        return cell
    }
}
