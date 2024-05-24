//
//  Color.swift
//  Telemetry Viewer
//
//  Created by Daniel Jilg on 10.10.20.
//

import Foundation
import SwiftUI

extension Color {
    #if os(macOS)
        static let grayColor = Color(NSColor.systemGray)
        static let separatorColor = Color(NSColor.separatorColor)
    #else
        static let grayColor = Color(UIColor.systemGray)
        static let separatorColor = Color(UIColor.separator)
    #endif

    static let telemetryOrange = Color("Torange")
    static let cardBackground = Color("CardBackgroundColor")
    static let customTextColor = Color("CustomTextColor")

    static let Zinc50 = Color("Zinc50")
    static let Zinc100 = Color("Zinc100")
    static let Zinc200 = Color("Zinc200")
    static let Zinc400 = Color("Zinc400")
    static let Zinc600 = Color("Zinc600")

}
