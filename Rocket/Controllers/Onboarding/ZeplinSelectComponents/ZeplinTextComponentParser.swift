//
//  ZeplinTextComponentParser.swift
//  Rocket
//
//  Created by KUTAN ÇINGISIZ on 6.03.2020.
//  Copyright © 2020 KUTAN ÇINGISIZ. All rights reserved.
//

import UIKit

struct ZeplinTextComponentParser {
    
}

// MARK: Text Maker

extension ZeplinTextComponentParser {
    func makeZeplinLabel(fromLayer layers: [ZeplinLayer]) -> [UILabel]? {
        var labels: [UILabel] = []
        
        layers.forEach {
            let label = UILabel()
            
            guard let textStyles = $0.text_styles else {
                return
            }
            
            if textStyles.count == 1 {
                let firstStyle = textStyles.first!.style
                label.font = makeFont(from: firstStyle)
                label.textColor = firstStyle.textColor
                label.text = $0.content ?? ""
                labels.append(label)
            } else {
                let multipleAttributedStringLabels = buildMultipleAtrributedString(fromTextStyles: textStyles, withContent: $0.content ?? "")
                label.attributedText = multipleAttributedStringLabels
                labels.append(label)
            }
        }
        
        return labels
    }
}

// MARK: Multiple Atrributed String Builder

extension ZeplinTextComponentParser {
    func buildMultipleAtrributedString(fromTextStyles textStyles: [ZeplinTextStyles], withContent content: String) -> NSAttributedString {
        let initialStyle = textStyles.first!
        let initialStyleFont = makeFont(from: initialStyle.style)
    
        let attributedString = NSMutableAttributedString(string: content, attributes: [
            .font: initialStyleFont,
            .foregroundColor: initialStyle.style.textColor,
            .kern: CGFloat(initialStyle.style.letter_spacing)
        ])
        
        /// We applied the first style to create an initial atrributedString
        /// So need to use it again
        var remaningStyles = textStyles
        remaningStyles.removeFirst()
        
        remaningStyles.forEach {
            let style = $0.style
            let font = makeFont(from: style)
            attributedString.addAttributes([
              .font: font,
              .foregroundColor: style.textColor
            ], range: NSRange(location: $0.range.location, length: $0.range.length))
        }
        
        return attributedString
    }
}


// MARK: Text Parser Extensions

extension ZeplinTextComponentParser {
    func makeFont(from style: ZeplinTextStyle) -> UIFont {
        if style.font_family == "SFProText" {
            
            if style.font_style == "Bold" {
                return .systemFont(ofSize: CGFloat(style.font_size), weight: .bold)
            }
            
            return .systemFont(ofSize: CGFloat(style.font_size))
        } else {
            return UIFont(name: style.postscript_name, size: CGFloat(style.font_size))!
        }
    }
}
