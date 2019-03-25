//
//  CollectionCell.swift
//  Shopify-Mobile-Challenge
//
//  Created by Elmer Astudillo on 3/22/19.
//  Copyright © 2019 Elmer Astudillo. All rights reserved.
//

import UIKit
import SnapKit

class CollectionCell: UITableViewCell {
    
    var imageV = UIImageView()
    var collectionLabel = UILabel()
    var containerView = UIView()
    var collection: Collection?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .clear
        containerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width - 40, height: self.frame.height - 100))
        containerView.layer.cornerRadius = 8.0
        containerView.layer.masksToBounds = false
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.1
        containerView.layer.shadowRadius = 5
        containerView.backgroundColor = UIColor.white
        
        imageV.kf.setImage(with: URL(string:collection?.imageString ?? "empty"))
        imageV.contentMode = .scaleAspectFit
        
        collectionLabel.text = collection?.title
        collectionLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        containerView.addSubview(imageV)
        containerView.addSubview(collectionLabel)
        self.addSubview(containerView)
        
        setContstrains()
    }
    
    func setContstrains(){
        
        containerView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        imageV.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(5)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        collectionLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(imageV.snp.right).offset(20)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
