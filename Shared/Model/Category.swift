//
//  Category.swift
//  Sellerx
//
//  Created by Gustavo Colaco on 11/04/19.
//  Copyright © 2019 Gustavo Colaco. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Category {
    var name: String
    var id: String
    var imgUrl: String
    var isActive: Bool = true
    var timeStamp: Timestamp
}
