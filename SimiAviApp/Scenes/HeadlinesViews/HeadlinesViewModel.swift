//
//  HeadlinesViewModel.swift
//  NewsReader
//
//  Created by Калякин Дима  on 11.08.2023.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa
import RxDataSources


extension TopStoryHeadline: IdentifiableType, Hashable{
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    
    static func == (lhs: TopStoryHeadline, rhs: TopStoryHeadline) -> Bool {
        lhs.title == rhs.title
    }  
    
    var identity: some Hashable {
        title
    }
}

struct NewsSection{
    var identity: String
    var items: [TopStoryHeadline]
}


extension NewsSection: AnimatableSectionModelType{
    init(original: NewsSection, items: [TopStoryHeadline]) {
        self = original
        self.items = items
    }
}

final class HeadlinesViewModel {
    
  
    
    let headlines: Driver<[NewsSection]>
    
    private let service: NewsServiceType
    
    init (service: NewsServiceType){
        self.service = service
        
    
        
        headlines = service
            .getTopHeadlines()
            .map{ headlines in
                return [
                    NewsSection(
                        identity: UUID().uuidString,
                        items: headlines
                    )
                ]
            }
            .asDriver(onErrorJustReturn: [])
        
    }
}
