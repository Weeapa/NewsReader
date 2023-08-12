//
//  TopStory.swift
//  NewsReader
//
//  Created by Калякин Дима  on 07.08.2023.
//

import Foundation

struct TopStoryHeadline: Decodable {
    struct Media: Decodable{
        let url: String
    }
    
    let title: String
    let url:String
}
