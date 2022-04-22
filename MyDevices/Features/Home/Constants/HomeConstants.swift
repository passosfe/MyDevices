//
//  HomeConstants.swift
//  MyDevices
//
//  Created by Felipe Passos on 22/04/22.
//

import Foundation
import SwiftUI

public enum HomeConstants {
    enum Colors {
        static let cardBackground = Color.cardBackground
        static let subtitleColor = Color.gray
    }
    
    enum Strings {
        static let status = "Status: "
        static let title = "Home"
        static let resultsAmmountPlaceholder = "{resultsPlaceholder}"
        static let resultsAmmount = "There are \(resultsAmmountPlaceholder) results for your query"
    }
    
    enum Sizes {
        static let cardCornerRadius: CGFloat = 25
    }
    
    enum Time {
        static let debounce: RunLoop.SchedulerTimeType.Stride = 0.5
    }
    
    enum ImageNames {
        static let phone = "iphone"
    }
}
