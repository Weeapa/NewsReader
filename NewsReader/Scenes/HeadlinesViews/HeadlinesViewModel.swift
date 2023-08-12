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

final class HeadlinesViewModel {
    let headline: Driver<[TopStoryHeadline]>
    
    private let service: NewsServiceType
    
    init (service: NewsServiceType){
        self.service = service
        
        headline = service
            .getTopHeadlines()
            .asDriver(onErrorJustReturn: [])
    }
}
