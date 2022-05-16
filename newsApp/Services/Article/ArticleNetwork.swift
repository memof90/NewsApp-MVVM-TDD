//
//  ArticleNetwork.swift
//  newsApp
//
//  Created by Memo Figueredo on 14/5/22.
//

import Foundation
import Moya
import UIKit

protocol ArticlesNetworkProtocol {
    func fetchPopularArticles(period: Int, completion: @escaping (Result<ArticlesResponse, Error>) -> () )
}

struct ArticlesNetwork: ArticlesNetworkProtocol {
        
    private let provider = MoyaProvider<ArticlesServices>()
    
    func fetchPopularArticles(period: Int, completion: @escaping (Result<ArticlesResponse, Error>) -> ()) {
        
        self.provider.request(.popular(period: period)) { result in
            switch result {
            case .success(let response):
                switch response.statusCode {
                case 200:
                    do {
                        let results = try JSONDecoder().decode(ArticlesResponse.self, from: response.data)
                        completion(.success(results))
                    } catch let error {
                        completion(.failure(error))
                    }
                default:
                    do {
                        let errorResponse = try JSONDecoder().decode(ErrorResponse.self, from: response.data)
                        let error = NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: errorResponse.errorResponse.failureString])
                        completion(.failure(error))
                    } catch let error {
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
