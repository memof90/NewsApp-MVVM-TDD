//
//  Urls.swift
//  newsApp
//
//  Created by Memo Figueredo on 14/5/22.
//

import Foundation



struct BaseService {
    
    static func popularArticles(period: Int) -> String {
        return "\(DomainUrl.mainDomain)/svc/mostpopular/v2/viewed/\(period).json?api-key=\(DomainUrl.apiKey)"
    }
    
}
