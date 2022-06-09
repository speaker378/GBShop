//
//  ReviewView.swift
//  GBShop
//
//  Created by Сергей Черных on 07.06.2022.
//

import SnapKit
import UIKit

final class ProductReviewView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold", size: 20)
        label.numberOfLines = 0
        label.textColor = .black
        label.text = "Reviews"
        return label
    }()
    
    lazy var reviewTextView: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        textView.layer.borderColor = UIColor.orange.cgColor
        textView.textColor = .black
        return textView
    }()
    
    lazy var addReviewButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add review", for: .normal)
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
    
    func makeReviews(reviews: [ReviewResult]) {
        reviews.forEach { review in
            let label = UILabel()
            label.font = UIFont(name: "Helvetica", size: 16)
            label.numberOfLines = 0
            label.textColor = .black
            label.text = review.text
            
            let lastView = subviews.last
            addSubview(label)
            label.snp.makeConstraints { make in
                make.top.equalTo(lastView!.snp.bottom).offset(24)
                make.leading.equalTo(self).inset(24)
                make.trailing.equalTo(self).inset(24)
            }
        }
    }
    
    private func configureViews() {
        let sizeInset: CGFloat = 24
        
        addSubview(titleLabel)
        addSubview(reviewTextView)
        addSubview(addReviewButton)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(sizeInset)
            make.leading.equalTo(self).inset(sizeInset)
        }
        
        reviewTextView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(sizeInset)
            make.leading.equalTo(self).offset(sizeInset)
            make.trailing.equalTo(self).offset(-sizeInset)
            make.height.equalTo(80)
        }
        
        addReviewButton.snp.makeConstraints { make in
            make.top.equalTo(reviewTextView.snp.bottom).offset(sizeInset)
            make.centerX.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.8)
        }
    }
}
