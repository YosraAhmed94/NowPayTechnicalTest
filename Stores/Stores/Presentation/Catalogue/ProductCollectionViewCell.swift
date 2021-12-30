//
//  ProductCollectionViewCell.swift
//  Stores
//
//  Created by Yousra Ahmed on 28/12/2021.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var itemNo: UILabel!
    private var item = 0
    
    @IBAction func addItem(_ sender: UIButton) {
        item += 1
        itemNo.text = "\(item)"
    }
    @IBAction func removeItem(_ sender: UIButton) {
        if item > 0{
            item -= 1
            itemNo.text = "\(item)"
        }
    }

}
