//
//  NewsDetail.swift
//  NewsFeed
//
//  Created by Pavel Bondar on 22.02.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import SwiftUI

struct NewsDetail: View {
    
    var news: News
    
    var body: some View {
        List {
            ZStack(alignment: .bottom) {
                Image(news.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Rectangle()
                .frame(height: 80)
                    .opacity(0.3)
                .blur(radius: 10)
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(news.name)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    Spacer()
                }
            }
            .listRowInsets(EdgeInsets())
            VStack(alignment: .leading) {
                Text(news.description)
                    .foregroundColor(.primary)
                    .font(.body)
                .lineLimit(nil)
                    .lineSpacing(12)
                
                HStack {
                    Spacer()
                    ReadMoreButton()
                }.padding(.top, 20)
            }.padding(.top)
                .padding(.bottom)
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
    }
}

struct ReadMoreButton: View {
    var body: some View {
        Button(action: {}) {
            Text("Read more...")
        }.frame(width: 200, height: 50)
            .foregroundColor(.blue)
            .font(.headline)
    }
}

struct NewsDetail_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetail(news: newsData[3])
    }
}
