//
//  ArticlesModel.swift
//  newsApp
//
//  Created by Memo Figueredo on 14/5/22.
//

import Foundation

// MARK: - articles main response


struct ArticlesResponse: Codable {
    let statusCode: String?
    let article: [Article]?
}
