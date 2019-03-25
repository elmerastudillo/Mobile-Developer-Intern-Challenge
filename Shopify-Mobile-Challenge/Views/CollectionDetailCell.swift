//
//  CollectionDetailTableViewCell.swift
//  Shopify-Mobile-Challenge
//
//  Created by Elmer Astudillo on 3/22/19.
//  Copyright © 2019 Elmer Astudillo. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionDetailCell: UITableViewCell {

    var imageV = UIImageView()
    var titleLabel = UILabel()
    var vendorLabel = UILabel()
    var inventoryLabel = UILabel()
    var containerView = UIView()
    var product: Product?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundColor = .clear
        
        containerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width - 40, height: self.frame.height))
        containerView.layer.cornerRadius = 8.0
        containerView.layer.masksToBounds = false
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.1
        containerView.layer.shadowRadius = 5
        containerView.backgroundColor = UIColor.white
        
        imageV.kf.setImage(with: URL(string:product?.imageURL ?? "empty"))
        imageV.contentMode = .scaleAspectFit
        
        titleLabel.text = product?.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        titleLabel.sizeToFit()
        titleLabel.numberOfLines = 0
    
        vendorLabel.text = product?.vendor
        vendorLabel.sizeToFit()
        vendorLabel.numberOfLines = 0
        vendorLabel.font = vendorLabel.font.withSize(12)
        
        let inventory = "Inventory: " + String(describing: product!.inventory)
        inventoryLabel.text = inventory
        inventoryLabel.textColor = UIColor.lightGray
        inventoryLabel.font = inventoryLabel.font.withSize(12)
        
        containerView.addSubview(imageV)
        containerView.addSubview(titleLabel)
        containerView.addSubview(vendorLabel)
        containerView.addSubview(inventoryLabel)
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
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageV.snp.top)
            make.left.equalTo(imageV.snp.right).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        vendorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalTo(imageV.snp.right).offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        inventoryLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
//            make.width.equalTo(30)
//            make.height.equalTo(30)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
