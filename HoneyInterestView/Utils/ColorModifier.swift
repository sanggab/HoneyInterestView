//
//  ColorModifier.swift
//  HoneyInterestView
//
//  Created by Gab on 2023/12/15.
//

import SwiftUI

extension Color {
    
    public init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        self.init(uiColor: UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: a))
    }
}
