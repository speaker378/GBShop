//
//  DetailProductViewController.swift
//  GBShop
//
//  Created by Сергей Черных on 07.06.2022.
//

import SnapKit
import UIKit

final class DetailProductViewController: UIViewController {
    
    var goodId: Int
    
    lazy var productViewController = ProductViewController(goodId: goodId)
    lazy var productReviewController = ReviewViewController(goodId: goodId)
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    lazy var contentView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    init(goodId: Int) {
        self.goodId = goodId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    func configureViews() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        addProductViewController()
        addReviewViewController()
        configureConstraints()
    }
    
    private func addProductViewController() {
        addChild(productViewController)
        contentView.addArrangedSubview(productViewController.view)
        productViewController.didMove(toParent: self)
    }
    
    private func addReviewViewController() {
        addChild(productReviewController)
        contentView.addArrangedSubview(productReviewController.view)
        productReviewController.didMove(toParent: self)
    }
    
    private func configureConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.width.equalTo(scrollView)
            make.edges.equalTo(scrollView)
        }
        
        productViewController.view.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.leading.equalTo(contentView)
            make.trailing.equalTo(contentView)
            make.height.equalTo(660)
        }
        
        productReviewController.view.snp.makeConstraints { make in
            make.top.equalTo(productViewController.view.snp.bottom).offset(20)
            make.leading.equalTo(contentView)
            make.trailing.equalTo(contentView)
            make.height.equalTo(600)
            make.bottom.equalTo(scrollView).offset(0)
        }
    }
}
