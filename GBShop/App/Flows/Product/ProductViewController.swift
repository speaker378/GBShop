//
//  ProductViewController.swift
//  GBShop
//
//  Created by Сергей Черных on 07.06.2022.
//

import UIKit

final class ProductViewController: UIViewController {
    
    lazy var goodsByIdRequestService: GoodsByIdRequestFactory = {
        return RequestFactory().makeGoodsById()
    }()
    
    lazy var addToCartService: AddToCartRequestFactory = {
        return RequestFactory().makeAddToCart()
    }()
    
    private var productView = ProductView()
    private let goodId: Int
    
    init(goodId: Int) {
        self.goodId = goodId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = productView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProductById(goodId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        productView.addToCartButton.addTarget(self, action: #selector(tapButtonAddToCart), for: .touchUpInside)
    }
    
    @objc
    private func tapButtonAddToCart(sender _: UIButton) {
        addToCartService.addToCart(requestModel: AddToCartRequest(
            productId: goodId,
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
    
    private func fetchProductById(_ id: Int) {
        goodsByIdRequestService.goods(requestModel: GoodByIdRequest(productId: goodId)) { [unowned self] response in
            DispatchQueue.main.async {
                switch response.result {
                case .success(let result):
                    if result.result == 1 {
                        self.productView.productNameLabel.text = result.productName
                        self.productView.productDescriptionLabel.text = result.description
                        self.productView.productPriceLabel.text = "\(result.price ?? 0)₽"
                    } else {
                        print(result.errorMessage ?? "Error")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
