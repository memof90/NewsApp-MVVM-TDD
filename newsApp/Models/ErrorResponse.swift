//
//  ErrorResponse.swift
//  newsApp
//
//  Created by Memo Figueredo on 14/5/22.
//

import Foundation

struct ErrorResponse: Codable {
    let errorResponse: FailureResponse
}

struct FailureResponse: Codable {
    let failureString: String
    let detail: DetailResponse
}

struct DetailResponse: Codable {
    let responseError: String
}
