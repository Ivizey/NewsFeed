# News feed

A native application built over a day that returns data from [News API](https://newsapi.org) and parses the JSON into viewable results. 

<p align="center">
    <img src="https://github.com/Ivizey/NewsFeed/blob/master/images/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202020-03-06%20at%2014.13.22.png" width="200">
    <img src="https://github.com/Ivizey/NewsFeed/blob/master/images/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202020-03-06%20at%2014.13.51.png" width="200">
    <img src="https://github.com/Ivizey/NewsFeed/blob/master/images/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202020-03-06%20at%2014.20.33.png" width="200">
    <img src="https://github.com/Ivizey/NewsFeed/blob/master/images/Simulator%20Screen%20Shot%20-%20iPhone%2011%20-%202020-03-06%20at%2014.20.43.png" width="200">
</p>

## Getting Started

Authentication is handled with a simple API key.
They're free for development, open-source, and non-commercial use, and you can get one here: [get API key](https://newsapi.org/register).
If you don't append your API key correctly, or your API key is invalid, you will receive a 401 - Unauthorized HTTP error.

You can attach your API key:

```
class NetworkService {
    private let API_KEY = "YOUR_KEY"
    func fetchNewsFeed(completionHandler: @escaping (NewsFeed?, Error?) -> ()) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "newsapi.org"
        components.path = "/v2/top-headlines"
        components.queryItems = [URLQueryItem(name: "country", value: "ua"),
                                 URLQueryItem(name: "apiKey", value: API_KEY)]
        guard let url = components.url else { return }
        URLSession
            .shared
            .dataTask(with: url) { (data, response, error) in
                guard let response = response as? HTTPURLResponse else { return }
                if let data = data, (200...299).contains(response.statusCode) {
                    do {
                        let news = try JSONDecoder().decode(NewsFeed.self, from: data)
                        completionHandler(news, nil)
                    } catch {
                        print(error.localizedDescription)
                        completionHandler(nil, error)
                    }
                }
        }.resume()
    }
}
```

## Deployment

### You can search for articles with any combination of the following criteria:

Keyword or phrase. Eg: find all articles containing the word 'Microsoft'.
+ Date published. Eg: find all articles published yesterday.
+ Source name. Eg: find all articles by 'TechCrunch'.
+ Source domain name. Eg: find all articles published on nytimes.com.
+ Language. Eg: find all articles written in English.

You can sort the results in the following orders:

+ Date published
+ Relevancy to search keyword
+ Popularity of source

### Data from News API:
```
struct Article: Codable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: URL?
    let urlToImage: URL?
    let publishedAt: String?
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String?
}

struct NewsFeed: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]
}
```

### Request parameters ([Details](https://newsapi.org/docs/endpoints/top-headlines))
```
components.queryItems = [URLQueryItem(name: "country", value: "ua"),
                                 URLQueryItem(name: "apiKey", value: API_KEY)]
```
+ country - The 2-letter ISO 3166-1 code of the country you want to get headlines for. 
+ category - The category you want to get headlines for. 
+ sources - A comma-seperated string of identifiers for the news sources or blogs you want headlines from. 
+ q - Keywords or a phrase to search for.
+ pageSize - The number of results to return per page (request).
+ page - Use this to page through the results if the total results found is greater than the page size.
+ apiKey - Your API key.
+ status - If the request was successful or not. 
+ totalResults - The total number of results available for your request.
+ articles - The results of the request.
+ source - The identifier id and a display name name for the source this article came from.
+ author - The author of the article
+ title - The headline or title of the article.
+ description - A description or snippet from the article.
+ url - The direct URL to the article.
+ urlToImage - The URL to a relevant image for the article.
+ publishedAt - The date and time that the article was published, in UTC (+000)
+ content - The unformatted content of the article, where available. 

## Built With
* [URLSession](https://developer.apple.com/documentation/foundation/urlsession) - An object that coordinates a group of related, network data-transfer tasks.
* [SwiftUI](https://developer.apple.com/xcode/swiftui/) -  SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. 
* [News API](https://newsapi.org) - Search worldwide news with code
