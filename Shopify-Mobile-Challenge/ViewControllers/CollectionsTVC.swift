//
//  CollectionsTableViewController.swift
//  Shopify-Mobile-Challenge
//
//  Created by Elmer Astudillo on 3/22/19.
//  Copyright © 2019 Elmer Astudillo. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionsTVC: UITableViewController {
    
    var collections : [Collection]? {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello")
        
        self.tableView.separatorStyle = .none
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.register(CollectionCell.self, forCellReuseIdentifier: "collectionCell")
        
        
        let networking = Networking.shared
        networking.fetch(route: .collections) { (data) in
            let collectionData = try? JSONDecoder().decode(Collections.self, from: data)
            guard let allCollections = collectionData?.custom_collections else {return}
            self.collections = allCollections
            print(self.collections)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return collections?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "collectionCell", for: indexPath) as! CollectionCell
        cell.collection = collections?[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
