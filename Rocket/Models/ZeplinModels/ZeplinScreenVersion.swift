//
//  ZeplinScreenVersion.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

struct ZeplinScreenVersion: Codable {
    let id: String
    let creator: ZeplinScreenVersionCreator
    let image_url: String
}

struct ZeplinScreenVersionCreator: Codable {
    let id: String
    let email: String
    let username: String
}
