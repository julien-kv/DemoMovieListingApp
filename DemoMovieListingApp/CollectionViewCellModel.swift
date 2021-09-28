//
//  CollectionViewCellModel.swift
//  DemoMovieListingApp
//
//  Created by Julien on 23/09/21.
//

import Foundation

struct MovieData:Codable{
    var page:MovieCell
    
    
}

struct MovieCell:Codable{
    var contentItems:contentItemStruct
    var title:String
    var totalContentItems:String
    var pageSize:String
    var pageNum:String
    
    enum CodingKeys: String, CodingKey{
        case contentItems="content-items"
        case totalContentItems="total-content-items"
        case title
        case pageSize="page-size"
        case pageNum="page-num"
    }
}

struct contentItemStruct:Codable {
    var content:[SingleMovieCell]
    
}

struct SingleMovieCell:Codable {
    let name: String
    let img:String
    
    
    enum Codingkeys: String, CodingKey{
        case name
        case img
        
    }
    
}
