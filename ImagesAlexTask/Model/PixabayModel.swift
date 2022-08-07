//
//  PixabayModel.swift
//  ImagesAlexTask
//
//  Created by Alex on 05.08.22.
//

import Foundation

struct StructFashion: Decodable {
    let hits: [HitsContainer]
}

struct HitsContainer: Decodable {

       let id: Int?
       let pageURL: String?
       let type, tags: String?
       let previewURL, imageURL: String?
       let previewWidth, previewHeight: Int?
       let webformatURL: String?
       let webformatWidth, webformatHeight: Int?
       let largeImageURL: String?
       let imageWidth, imageHeight, imageSize, views: Int?
       let downloads, collections, likes, comments: Int?
       let userID: Int?
       let user: String?
       let userImageURL: String?
    
}
