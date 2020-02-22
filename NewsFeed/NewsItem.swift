//
//  NewsItem.swift
//  NewsFeed
//
//  Created by Pavel Bondar on 22.02.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import SwiftUI

struct NewsItem: View {
    var news: News
    var body: some View {
        Image(news.imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 300, height: 170)
            .cornerRadius(5)
            .shadow(radius: 10)
    }
}

struct NewsItem_Previews: PreviewProvider {
    static var previews: some View {
        NewsItem(news: newsData[0])
    }
}
