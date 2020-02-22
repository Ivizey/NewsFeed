//
//  HomeView.swift
//  NewsFeed
//
//  Created by Pavel Bondar on 22.02.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var categories: [String: [News]] {
        .init(
            grouping: newsData,
            by: {$0.category.rawValue}
        )
    }
    var body: some View {
        NavigationView {
            List(categories.keys.sorted(), id: \String.self) { key in
                NewsRow(categoryName: "\(key) News".uppercased(), news: self.categories[key]!)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
