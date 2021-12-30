//
//  CollectionViewController.swift
//  Shoe store
//
//  Created by Yousra Ahmed on 29/12/2021.
//


import UIKit
// 3f89f93b763b23160e61b898f30fbceb
// b4c6e68629647841
class CatalogueViewController: UIViewController {
    @IBOutlet weak var spinner:   UIActivityIndicatorView?
    @IBOutlet weak var catalogueCollection: UICollectionView!
    private let reuseIdentifier = "productCellID"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    fileprivate var products:[Product] = []
    fileprivate let cataloguePresenter = CataloguePresenter()//dogService: DoggyService())
    private let itemsPerRow: CGFloat = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        catalogueCollection.delegate = self
        catalogueCollection.dataSource = self
        spinner?.hidesWhenStopped = true
        cataloguePresenter.attachView(true, view: self)
        cataloguePresenter.getProducts()
    }
}

// MARK: - UICollectionViewDataSource
extension CatalogueViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductCollectionViewCell
        //cell.image =
        cell.title.text = products[indexPath.row].name
        cell.price.text = "\(products[indexPath.row].price)"
        if let photo = products[indexPath.row].largeImage{
            cell.image.image = photo
        }
        return cell
    }
    
    
 /* override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  */
}

// MARK: - Collection View Flow Layout Delegate
extension CatalogueViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
    let availableWidth = view.frame.width - paddingSpace
    let widthPerItem = availableWidth / itemsPerRow
    
      return CGSize(width: widthPerItem, height: widthPerItem + 80.0)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return sectionInsets
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return sectionInsets.left
  }
    
    
}

extension CatalogueViewController:CatalogueViewDelegate{


    func startLoading() {
            spinner?.startAnimating()
        }

        func finishLoading() {
            spinner?.stopAnimating()
        }

    func setProducts(products: [Product]) {
        self.products = products
        catalogueCollection?.isHidden = false
        catalogueCollection?.reloadData()
        }

    func setEmpty() {
            catalogueCollection?.isHidden = true
        }
    
    func setPhoto(index:Int, image:UIImage){
        products[index].largeImage = image
        catalogueCollection?.reloadData()
        //catalogueCollection.reloadItems(at: [IndexPath(item: index, section: 1)])
    }
}
