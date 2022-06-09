//
//  CartViewController.swift
//  GBShop
//
//  Created by Сергей Черных on 09.06.2022.
//

import UIKit
import SnapKit

final class CartViewController: UITableViewController {
    
    lazy var payCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pay cart", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.orange.cgColor
        return button
    }()
    
    lazy var addToCartService: AddToCartRequestFactory = {
        return RequestFactory().makeAddToCart()
    }()
    
    lazy var removeFromCartService: RemoveFromCartRequestFactory = {
        return RequestFactory().makeRemoveFromCart()
    }()
    
    lazy var payCartService: PayCartRequestFactory = {
        return RequestFactory().makePayCart()
    }()
    
    lazy var getCartService: GetCartRequestFactory = {
        return RequestFactory().makeGetCart()
    }()
    
    private var goods: [CartListItem] = [] {
        didSet {
            let totalPrice: Double = {
                var result: Double = 0
                goods.forEach { product in
                    result += Double(product.quantity) * product.price
                }
                return result
            }()
            DispatchQueue.main.async {
                self.payCartButton.setTitle("Pay \(totalPrice)", for: .normal)
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGoodsList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        payCartButton.addTarget(self, action: #selector(tapButtonPay), for: .touchUpInside)
        fetchGoodsList()
    }
    
    @objc
    private func tapButtonPay(sender _: UIButton) {
        payCartService.payCart(requestModel: PayCartRequest(userId: CurrentUser.shared.user!.id)) { [weak self] response in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch response.result {
                case .success(let result):
                    if result.result == 1 {
                        self.goods = []
                        self.showMessage(result.userMessage ?? "", title: "Success")
                    } else {
                        self.showMessage(result.errorMessage ?? "", title: "Error")
                    }
                case .failure(let error):
                    self.showMessage(error.localizedDescription, title: "Error")
                }
            }
        }
    }
    
    private func fetchGoodsList() {
        getCartService.getCart(requestModel: GetCartRequest(
            userId: CurrentUser.shared.user!.id
        )) { [unowned self] response in
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
    
    private func removeFromCart(indexPath: IndexPath, quantity: Int) {
        let product = goods[indexPath.row]
        removeFromCartService.removeFromCart(requestModel: RemoveFromCartRequest(
            productId: product.productId,
            userId: CurrentUser.shared.user!.id,
            quantity: quantity
        )) { [unowned self] response in
            switch response.result {
            case .success(let result):
                if result.result == 1 {
                    print(result.userMessage ?? "")
                    self.goods.remove(at: indexPath.row)
                } else {
                    print(result.errorMessage ?? "")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func addToCart(indexPath: IndexPath, quantity: Int) {
        let product = goods[indexPath.row]
        addToCartService.addToCart(requestModel: AddToCartRequest(
            productId: product.productId,
            userId: CurrentUser.shared.user!.id,
            quantity: quantity
        )) { [unowned self] response in
            switch response.result {
            case .success(let result):
                if result.result == 1 {
                    print(result.userMessage ?? "")
                    DispatchQueue.main.async {
                        let cell = self.tableView.cellForRow(at: indexPath) as! CartTableViewCell
                        cell.qualityLabel.text = String(Int(cell.qualityLabel.text!)! + 1)
                    }
                    
                } else {
                    print(result.errorMessage ?? "")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func showMessage(_ message: String, title: String ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
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
        let cell = CartTableViewCell(style: .default, reuseIdentifier: "CartTableViewCell")
        cell.selectionStyle = .none
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
                title: "Remove all") { [unowned self] (_, _, completionHandler) in
                    self.removeFromCart(indexPath: indexPath, quantity: goods[indexPath.row].quantity)
                    completionHandler(true)
                }
            action.backgroundColor = .systemRed
            return UISwipeActionsConfiguration(actions: [action])
        }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(
            style: .normal,
            title: "Add more") { [unowned self] (_, _, completionHandler) in
                self.addToCart(indexPath: indexPath, quantity: 1)
                completionHandler(true)
            }
        action.backgroundColor = .systemBlue
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return payCartButton
    }
}
