import Foundation
import Fakery

var fakery = Faker(locale: "ru")

struct TopStoryHeadline: Decodable {
    struct Media: Decodable{
        let url: String
    }
    
    let title: String
    let url:String
    var section: String?
    var byLine: String?
    
    static var placeholder: TopStoryHeadline{
        TopStoryHeadline(title: fakery.name.firstName(),
                         url: fakery.internet.domainName(),
                         section: fakery.address.countryCode(),
                         byLine: fakery.address.city())
    }
}


