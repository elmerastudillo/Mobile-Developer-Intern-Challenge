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
        containerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        containerView.layer.cornerRadius = 8.0
        containerView.layer.masksToBounds = false
        containerView.clipsToBounds = false
        
        imageV.kf.setImage(with: URL(string:collection?.imageString ?? "empty"))
        collectionLabel.text = collection?.title
        containerView.addSubview(imageV)
        containerView.addSubview(collectionLabel)
    }
    
    func setContstrains(){
        
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        imageV.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(5)
        }
        
        collectionLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.left.equalTo(imageV.snp.right).offset(20)
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
