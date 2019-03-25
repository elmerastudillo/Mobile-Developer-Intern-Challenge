//
//  CollectionDetailsHeader.swift
//  Shopify-Mobile-Challenge
//
//  Created by Elmer Astudillo on 3/24/19.
//  Copyright © 2019 Elmer Astudillo. All rights reserved.
//

import UIKit
import Kingfisher

class DetailHeaderView: UITableViewHeaderFooterView {
    
    var collectionTitleLabel = UILabel()
    var collectionDescriptionLabel = UILabel()
    var imageView = UIImageView()
    var collection: Collection?
    
    // MARK: - INITIALIZATION
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LAYOUT
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let collection = self.collection else { return }
        collectionTitleLabel.text = collection.title
        collectionTitleLabel.textAlignment = .center
        collectionTitleLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        collectionDescriptionLabel.text = collection.body
        collectionDescriptionLabel.font = collectionDescriptionLabel.font?.withSize(12)
        collectionDescriptionLabel.textAlignment = .center
        collectionDescriptionLabel.numberOfLines = 0
        imageView.kf.setImage(with: URL(string: collection.imageString))
        
        self.addSubview(collectionTitleLabel)
        self.addSubview(collectionDescriptionLabel)
        self.addSubview(imageView)
        
        setConstraints()
    }
    
    // MARK: - CONSTRAINTS
    func setConstraints(){
        imageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        collectionTitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(10)
        }
        
        collectionDescriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(collectionTitleLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.centerX.equalTo(collectionTitleLabel.snp.centerX)
        }
    }
}
