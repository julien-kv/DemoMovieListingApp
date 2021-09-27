//
//  CollectionViewCellModel.swift
//  DemoMovieListingApp
//
//  Created by Julien on 23/09/21.
//

import Foundation

struct MovieData:Decodable{
    var page:MovieCell
    
    
}

struct MovieCell:Decodable{
    
    enum CodingKeys: String, CodingKey{
        case contentItems="content-items"
        case totalContentItems="total-content-items"
        case title
        case pageSize="page-size"
        case pageNum="page-num"
    }
    var contentItems:contentItemStruct
    var title:String
    var totalContentItems:String
    var pageSize:String
    var pageNum:String
    
}

struct contentItemStruct:Decodable {
    var content:[SingleMovieCell]
    
}

struct SingleMovieCell:Decodable {
   enum Codingkeys: String, CodingKey{
        case name
        case posterImage = "poster-image"
    }
    //var posterImage:String
    var name:String
    
    
    
}
//
/// MARK: - Welcome
//struct Welcome: Codable {
//    let page: Page
//}
//
//// MARK: - Page
//struct Page: Codable {
//    let title, totalContentItems, pageNum, pageSize: String
//    let contentItems: ContentItems
//
//    enum CodingKeys: String, CodingKey {
//        case title
//        case totalContentItems = "total-content-items"
//        case pageNum = "page-num"
//        case pageSize = "page-size"
//        case contentItems = "content-items"
//    }
//}
//
//// MARK: - ContentItems
//struct ContentItems: Codable {
//    let content: [Content]
//}
//
//// MARK: - Content
//struct Content: Codable {
//    let name: Name
//    let posterImage: PosterImage
//
//    enum CodingKeys: String, CodingKey {
//        case name
//        case posterImage = "poster-image"
//    }
//}
