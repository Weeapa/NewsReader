//
//  NewsService.swift
//  NewsReader
//
//  Created by Калякин Дима  on 07.08.2023.
//

import Foundation
import RxSwift

protocol NewsServiceType{
    func getTopHeadlines() -> Observable<[TopStoryHeadline]>
}

final class NewsService: NewsServiceType{
    func getTopHeadlines() -> Observable<[TopStoryHeadline]>  {
        return Observable.never()
    }
    
}
