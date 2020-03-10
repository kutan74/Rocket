//
//  ZeplinScreenComponents.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

struct ZeplinScreenComponents: Codable {
    let id: String
    let layers: [ZeplinLayer]
}

struct ZeplinLayer: Codable {
    let id: String
    let source_id: String
    let type: String
    let name: String
    let rect: ZeplinLayerRect
    let fills: [ZeplinLayerFill]?
    let content: String?
    let layers: [ZeplinSubLayer]?
    let text_styles: [ZeplinTextStyles]?
}

struct ZeplinSubLayer: Codable {
    let id: String
    let source_id: String
    let type: String
    let name: String
    let rect: ZeplinLayerRect
    let fills: [ZeplinLayerFill]?
    let content: String?
    let text_styles: [ZeplinTextStyles]?
}

struct ZeplinLayerRect: Codable {
    let y: Int
    let x: Int
    let width: Int
    let height: Int
}

struct ZeplinLayerFill: Codable {
    let type: String
    let color: ZeplinLayerColor
    let opacity: CGFloat
}

// MARK: TextStyle

struct ZeplinTextStyles: Codable {
    let range: ZeplinTextStyleRange
    let style: ZeplinTextStyle
}

// MARK: TextStyle Range

struct ZeplinTextStyleRange: Codable {
    let location: Int
    let length: Int
}

struct ZeplinTextStyle: Codable {
    let postscript_name: String
    let font_family: String
    let font_size: Int
    let font_weight: Int
    let font_style: String
    let color: ZeplinLayerColor
    let letter_spacing: Double
}

struct ZeplinLayerColor: Codable {
    let r: Int
    let g: Int
    let b: Int
    let a: Int
}

extension ZeplinTextStyle {
    var textColor: UIColor {
        return UIColor(red: CGFloat(Double(color.r) / 255.0),
                       green: CGFloat(Double(color.g) / 255.0),
                       blue: CGFloat(Double(color.b) / 255.0),
                       alpha: CGFloat(color.a))
    }
}

extension ZeplinLayerColor {
    var fillColor: UIColor {
        return UIColor(red: CGFloat(Double(r) / 255.0),
                       green: CGFloat(Double(g) / 255.0),
                       blue: CGFloat(Double(b) / 255.0),
                       alpha: CGFloat(a))
    }
}
