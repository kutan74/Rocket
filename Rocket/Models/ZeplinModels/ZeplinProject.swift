//
//  ZeplinProject.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import Foundation

struct ZeplinProject: Codable {
    let id: String
    let name: String
    let thumbnail: String?
    let platform: String
    let status: String
    let created: Int
    let number_of_screens: Int
}
