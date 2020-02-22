//
//  News.swift
//  NewsFeed
//
//  Created by Pavel Bondar on 22.02.2020.
//  Copyright © 2020 Pavel Bondar. All rights reserved.
//

import SwiftUI

struct News: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var imageName: String
    var category: Category
    var descriptiond: String
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case education = "education"
        case sport = "sport"
    }
}
