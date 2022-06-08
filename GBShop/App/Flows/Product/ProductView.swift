//
//  ProductView.swift
//  GBShop
//
//  Created by Сергей Черных on 07.06.2022.
//

import SnapKit
import UIKit

final class ProductView: UIView {
    
    lazy var productNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    lazy var productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica", size: 16)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        label.numberOfLines = 1
        label.textColor = .red
        return label
    }()
    
    lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add to cart", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.orange.cgColor
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureViews()
    }
    
    private func configureViews() {
        let sizeInset: CGFloat = 20
        
        addSubview(productNameLabel)
        addSubview(productDescriptionLabel)
        addSubview(productPriceLabel)
        addSubview(addToCartButton)
        
        productNameLabel.snp.makeConstraints { make -> Void in
            make.leading.equalTo(self).inset(sizeInset)
            make.top.equalTo(self.safeAreaLayoutGuide).offset(sizeInset)
        }
        
        productDescriptionLabel.snp.makeConstraints { make -> Void in
            make.leading.equalTo(self).inset(sizeInset)
            make.trailing.equalTo(self).inset(sizeInset)
            make.top.equalTo(productNameLabel.snp.bottom).offset(sizeInset)
        }
        
        productPriceLabel.snp.makeConstraints { make -> Void in
            make.leading.equalTo(self).inset(sizeInset)
            make.top.equalTo(productDescriptionLabel.snp.bottom).offset(sizeInset)
        }
        
        addToCartButton.snp.makeConstraints { make -> Void in
            make.centerX.equalTo(self)
            make.top.equalTo(productPriceLabel.snp.bottom).offset(sizeInset)
            make.width.equalTo(self).multipliedBy(0.8)
        }
    }
}
