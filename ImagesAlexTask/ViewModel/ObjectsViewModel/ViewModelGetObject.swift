//
//  ViewModelGetObject.swift
//  ImagesAlexTask
//
//  Created by Alex on 05.08.22.
//

import Foundation
import UIKit

struct ViewModelGetObject {
    private let hitsContainer: HitsContainer
    
    init(hitsContainer: HitsContainer) {
        self.hitsContainer = hitsContainer
    }
    
    func loadImageInfo() -> String {
        return hitsContainer.user ?? ""
        
    }
    func loadImageTag() -> String {
        return hitsContainer.tags ?? ""
        
    }
    func loadImageType() -> String {
        return hitsContainer.type ?? ""
        
    }
    func loadImageSize() -> Int {
        return hitsContainer.imageSize ?? 0
        
    }
    func loadImageLikes() -> Int {
        return hitsContainer.likes ?? 0
        
    }
    func loadImageComments() -> Int {
        return hitsContainer.comments ?? 0
        
    }
    func loadImageCollections() -> Int {
        return hitsContainer.collections ?? 0
        
    }
    func loadImageViews() -> Int {
        return hitsContainer.views ?? 0
        
    }
    func loadImageDownloand() -> Int {
        return hitsContainer.downloads ?? 0
        
    }
    
    func loadPreviewImage(completion: @escaping(UIImage?) -> Void) {
        let urlString = hitsContainer.webformatURL
        guard let url = URL(string: urlString ?? "") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
    
    func loadDetailImage(completion: @escaping(UIImage?) -> Void) {
        let urlString = hitsContainer.largeImageURL
        guard let url = URL(string: urlString ?? "") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
    func loadUserImage(completion: @escaping(UIImage?) -> Void) {
        let urlString = hitsContainer.userImageURL
        guard let url = URL(string: urlString ?? "") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            let image = UIImage(data: data)
            completion(image)
        }.resume()
    }
}
