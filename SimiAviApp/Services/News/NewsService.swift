import Foundation
import RxSwift


protocol NewsServiceType{
    func getTopHeadlines() -> Observable<[TopStoryHeadline]>
}

final class NewsService: NewsServiceType{
    func getTopHeadlines() -> Observable<[TopStoryHeadline]>  {
        let request = URLRequest(
            url: URL(string:
                        "https://api.nytimes.com/svc/topstories/v2/world.json?api-key=Pa0JTcf9EzDyXKDtCZbdHzm6jfKG8xZz")!
        )
        
        
        struct Response: Decodable {
            let results: [TopStoryHeadline]
        }
        
        return URLSession.shared
            .rx
            .data(request: request)
            .map{ data in
                try! JSONDecoder().decode(Response.self, from: data)
            }
            .map(\.results)
    }
    
}
