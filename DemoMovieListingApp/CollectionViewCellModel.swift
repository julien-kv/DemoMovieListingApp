//
//  CollectionViewCellModel.swift
//  DemoMovieListingApp
//
//  Created by Julien on 23/09/21.
//

import Foundation

struct MovieData:Decodable{
    struct MovieCell:Decodable{
        
        enum CodingKeys:String,CodingKey{
            case contentItems="content-items"
        }
        struct contentItemStruct:Decodable {
            
            struct SingleMovieCell:Decodable {
                enum Codingkeys:String,CodingKey{
                    case name
                    case posterImage="poster-image"
                }
                var name:String
                var posterImage:String
            }
            var content:[SingleMovieCell]
        }
        var contentItems:contentItemStruct
    }
    var page:MovieCell
    
}


