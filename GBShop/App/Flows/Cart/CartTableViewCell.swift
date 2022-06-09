//
//  CartTableViewCell.swift
//  GBShop
//
//  Created by Сергей Черных on 09.06.2022.
//

import UIKit
import SnapKit

class CartTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        priceLabel.text = nil
    }
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .red
        return label
    }()
    
    lazy var qualityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        return label
    }()
    
    fileprivate func configureViews() {
        let sizeInset = 10
        let cellHeight: CGFloat = 120
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(qualityLabel)
        
        contentView.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom)
            make.leading.equalTo(safeAreaLayoutGuide).inset(sizeInset)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(sizeInset)
            make.height.equalTo(cellHeight)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.leading.equalTo(contentView).inset(sizeInset)
            make.trailing.equalTo(contentView).inset(sizeInset)
            make.height.equalTo(70)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(contentView).inset(sizeInset)
            make.top.equalTo(nameLabel.snp.bottom).offset(15)
        }
        
        qualityLabel.snp.makeConstraints { make in
            make.trailing.equalTo(contentView).offset(-24)
            make.centerY.equalTo(contentView)
        }
    }
    
    func configure(_ model: CartListItem) {
        nameLabel.text = model.productName
        priceLabel.text = "\(model.price)₽"
        qualityLabel.text = "\(model.quantity)"
    }
}
