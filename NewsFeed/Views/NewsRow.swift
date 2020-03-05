//
//  NewsRow.swift
//  NewsFeed
//
//  Created by Pavel Bondar on 22.02.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import SwiftUI

struct NewsRow: View {
    
    var categoryName: String
    var news: [News]
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.title)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(self.news) { news in
                        GeometryReader { geometry in
                            NavigationLink(destination: NewsDetail(news: news)) {
                            NewsItem(news: news)
                                .frame(width: 300)
                                .padding(.trailing, 30)
                            }
                            .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX) - 40) / -20, axis: (x: 0, y: 10.0, z: 0))
                        }
                        .frame(width: 246)
                    }
                }
            }
        }
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(categoryName: "SPORT", news: newsData)
    }
}
