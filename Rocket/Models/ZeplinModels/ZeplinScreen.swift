//
//  ZeplinScreen.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

struct ZeplinScreen: Codable {
    let id: String
    //let created: Int
    //let name: String
    //let image: ZeplinScreenImage
}

struct ZeplinScreenImage: Codable {
    let width: Int
    let height: Int
    let original_url: String
}
