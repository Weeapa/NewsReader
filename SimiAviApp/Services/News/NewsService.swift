import Foundation
import RxSwift


protocol NewsServiceType{
    func getTopHeadlines() -> Observable<[TopStoryHeadline]>
}

final class NewsService: NewsServiceType{
    func getTopHeadlines() -> Observable<[TopStoryHeadline]>  {
        return Observable.just([
            TopStoryHeadline.placeholder,
            TopStoryHeadline.placeholder,
            TopStoryHeadline.placeholder,
            TopStoryHeadline.placeholder,
            TopStoryHeadline.placeholder,
            TopStoryHeadline.placeholder,
        ])
    }
    
}
