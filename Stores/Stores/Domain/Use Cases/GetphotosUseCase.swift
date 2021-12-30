//
//  GetphotosUseCase.swift
//  Stores
//
//  Created by Yousra Ahmed on 29/12/2021.
//

import Foundation

final class GetPhotosUseCase{
    private let photoRemoteDataSouce = PhotoDataSource()

    func execute(requestValue: GetPhotoRequestValue, completion: @escaping (Data?, Error?) -> Void){
        photoRemoteDataSouce.fetchPhoto(photo: requestValue.photo){ result, error in
            if error == nil {
                completion(result, nil)
            }
            else{
                completion(nil, error)
            }
        }
    }
}

struct GetPhotoRequestValue:RequestValue {
    let photo:Photo
}
