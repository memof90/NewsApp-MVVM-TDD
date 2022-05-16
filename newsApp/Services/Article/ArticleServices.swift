//
//  ArticleServices.swift
//  newsApp
//
//  Created by Memo Figueredo on 14/5/22.
//

import Moya
import Foundation

enum ArticlesServices {
    case popular(period: Int)
}

typealias Method = Moya.Method

extension ArticlesServices: TargetType {
    
    var baseURL: URL {
        switch self {
        case .popular(let period):
            guard let url = URL(string: BaseService.popularArticles(period: period)) else { fatalError() }
                 return url
        }
    }
    
    var path: String {
        return ""
    }
    
    var method: Method {
        .get
    }
    
    var task: Task {
        .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
        
}
