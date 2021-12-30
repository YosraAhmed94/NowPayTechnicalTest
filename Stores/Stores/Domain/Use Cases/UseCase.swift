//
//  UseCase.swift
//  Baby Health Keaper
//
//  Created by Yousra Ahmed on 26/12/2021.
//

import Foundation

protocol UseCase {
    func execute(requestValue: RequestValue,
 //                cached: @escaping (MoviesPage) -> Void,
                 completion: @escaping (Any, Error) -> Void)
}
protocol RequestValue{
    
}
