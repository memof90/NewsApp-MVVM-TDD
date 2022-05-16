//
//  ExtDowloadImage.swift
//  newsApp
//
//  Created by Memo Figueredo on 14/5/22.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func DownloadImage(_ URLString: String, placeHolder: String? , cornerRadius : CGFloat?) {
        
        let url = URL(string: URLString)
        let processor = DownsamplingImageProcessor(size: self.bounds.size)
        |> RoundCornerImageProcessor(cornerRadius: cornerRadius != nil ? cornerRadius! : CGFloat(0.0))
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            placeholder: placeHolder != nil ? UIImage(named: placeHolder!) : nil,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(_):
                break
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
