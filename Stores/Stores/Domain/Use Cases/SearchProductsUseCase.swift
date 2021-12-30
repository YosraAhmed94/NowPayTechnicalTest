
import Foundation

final class SearchProductUseCase{
    
    private let productRemoteDataSource = ProductRemoteDataSource()
    private let photoRemoteDataSouce = PhotoDataSource()

    func execute(requestValue: SearchProductUseCaseRequestValue, completion: @escaping ([Photo], Error?) -> Void){
        productRemoteDataSource.fetchProducts(category: requestValue.category){ result, error in
            if error == nil {
                completion(result, nil)
            }
        }
    }
}

struct SearchProductUseCaseRequestValue:RequestValue {
    let category:String
}
