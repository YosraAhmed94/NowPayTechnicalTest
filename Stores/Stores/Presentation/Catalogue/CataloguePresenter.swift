//
//  CataloguePresenter.swift
//  Baby Health Keaper
//
//  Created by Yousra Ahmed on 28/12/2021.
//

import Foundation
import UIKit


protocol CatalogueViewDelegate{//delegate
    func startLoading()
    func finishLoading()
    func setProducts(products: [Product])
    func setEmpty()
    func setPhoto(index:Int, image:UIImage)
}

class CataloguePresenter{
    
    // MARK: - Private
//    fileprivate let dogService: DoggyService
    fileprivate var catalogueView: CatalogueViewDelegate?
    fileprivate let searchProductUseCase = SearchProductUseCase()
    fileprivate let getPhotoUseCase = GetPhotosUseCase()
//    init(dogService: DoggyService){
//        self.dogService = dogService
//    }

    func attachView(_ attach: Bool, view: CatalogueViewDelegate?) {
        if !attach {
            catalogueView = nil
        } else {
            if let view = view { catalogueView = view }
        }
    }

    func getProducts(){
        self.catalogueView?.startLoading()
        searchProductUseCase.execute(requestValue: SearchProductUseCaseRequestValue(category: "apple")){result, error in
            DispatchQueue.main.async {
                self.catalogueView?.finishLoading()
                if error == nil{
                    self.getPhotos(photos: result)
                    var products:[Product]=[]
                    for photo in result{
                        products.append(Product(name: photo.title, price: Int.random(in: 500..<3000)))
                    }
                    
                    self.catalogueView?.setProducts(products: products)
                    
                }
                else{
                    self.catalogueView?.setEmpty()
                }
            }
        }
    }
    func getPhotos(photos: [Photo]){
        for (index, photo) in photos.enumerated() {
            getPhotoUseCase.execute(requestValue: GetPhotoRequestValue(photo: photo)){ data, error in
                if error == nil{
                    DispatchQueue.main.async {
                        self.catalogueView?.setPhoto(index: index, image: UIImage(data: data!)!)
                    }
                    
                }
            }
        }
        
    }
}
