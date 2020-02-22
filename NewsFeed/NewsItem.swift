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
        VStack(alignment: .leading, spacing: 16.0) {
            Image(news.imageName)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 170)
                .cornerRadius(5)
                .shadow(radius: 10)
            VStack {
            Text(news.name)
                .foregroundColor(.primary)
                .font(.headline)
                Text(news.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .frame(height: 40)
            }
        }
    }
}

struct NewsItem_Previews: PreviewProvider {
    static var previews: some View {
        NewsItem(news: newsData[0])
    }
}
