//
//  CollectionDetailsTableViewController.swift
//  Shopify-Mobile-Challenge
//
//  Created by Elmer Astudillo on 3/22/19.
//  Copyright © 2019 Elmer Astudillo. All rights reserved.
//

import UIKit

class CollectionDetailsTVC: UITableViewController {
    
    //MARK: VARIABLES
    var collection: Collection!
    var products: [Product]? {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Products";
        
        self.tableView = UITableView(frame: self.tableView.frame, style: .grouped)
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(CollectionDetailCell.self, forCellReuseIdentifier: "collectionDetailCell")
        self.tableView.register(DetailHeaderView.self, forHeaderFooterViewReuseIdentifier: "detailsHeaderView")
        
        fetchProducts()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "collectionDetailCell", for: indexPath) as! CollectionDetailCell
        cell.product = products?[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let detailHeaderView = DetailHeaderView()
        detailHeaderView.collection = collection
        return detailHeaderView
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 175
    }
}

extension CollectionDetailsTVC{
    // MARK: - Helpers (
    func fetchProducts(){
        let networking = Networking.shared
        let collectionID = String(describing: collection.id)
        var collectIDs = ""
        networking.fetch(route: .collect(id: collectionID)) { (data) in
            let collectData = try? JSONDecoder().decode(Collects.self, from: data)
            guard let allCollections = collectData?.collects else {return}
            
            for collect in allCollections{
                let productID = String(describing: collect.productID)
                collectIDs += productID + ","
            }
            collectIDs = String(collectIDs.dropLast())
            self.getProducts(collectID: collectIDs)
        }
    }
    
    func getProducts(collectID: String){
        let networking = Networking.shared
        networking.fetch(route: .products(id: collectID)) { (data) in
            let productData = try? JSONDecoder().decode(Products.self, from: data)
            guard let products = productData?.products else {return}
            self.products = products
        }
    }
}
