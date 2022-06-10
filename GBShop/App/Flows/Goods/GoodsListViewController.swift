//
//  GoodsListViewController.swift
//  GBShop
//
//  Created by Сергей Черных on 06.06.2022.
//

import UIKit
import FirebaseCrashlytics

final class GoodsListViewController: UITableViewController {
    
    lazy var goodsListDataService: GoodsListRequestFactory = {
        return RequestFactory().makeGoodsList()
    }()
    
    lazy var addToCartService: AddToCartRequestFactory = {
        return RequestFactory().makeAddToCart()
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
        Crashlytics.createLog(.viewCatalog)
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
    
    private func addToCart(indexPath: IndexPath) {
        let product = goods[indexPath.row]
        addToCartService.addToCart(requestModel: AddToCartRequest(
            productId: product.productId,
            userId: CurrentUser.shared.user!.id,
            quantity: 1
        )) { response in
            switch response.result {
            case .success(let result):
                if result.result == 1 {
                    print(result.userMessage ?? "")
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
        let good = goods[indexPath.row]
        let cell = GoodsTableViewCell(style: .default, reuseIdentifier: "GoodsTableViewCell")
        cell.configure(good)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productId = goods[indexPath.row].productId
        let viewController = DetailProductViewController(goodId: productId)
        present(viewController, animated: true, completion: nil)
    }
    
    override func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let action = UIContextualAction(
                style: .normal,
                title: "add to cart") { [unowned self] (_, _, completionHandler) in
                    self.addToCart(indexPath: indexPath)
                    completionHandler(true)
                }
            action.backgroundColor = .systemBlue
            return UISwipeActionsConfiguration(actions: [action])
        }
}
