//
//  DeviceConstants.swift
//  MyDevices
//
//  Created by Felipe Passos on 22/04/22.
//

import Foundation
import SwiftUI

public enum DeviceConstants {
    enum Colors {
        static let cardBackground =  Color.cardBackground
        static let shadow = Color.black.opacity(0.2)
        static let subtitleForegroundColor = Color.gray
    }
    
    enum Strings {
        static let name = "Name"
        static let os = "OS"
        static let status = "Status"
        static let size = "Size"
        static let stars = "Stars"
        
        static let favouriteIconAccessibility = "FavouriteIcon"
    }
    
    enum Sizes {
        static let imageHeight: CGFloat = 250
        static let imageOffset: CGFloat = -180
        static let imagePaddingTop: CGFloat = 40
        static let imagePaddingBottom: CGFloat = -170
        static let cornerRadius: CGFloat = 25
        static let shadowRadius: CGFloat = 10
        static let shadowX: CGFloat = 0
        static let shadowY: CGFloat = 0
        static let topPadding: CGFloat = -imageOffset
        
    }
    
    enum ImageNames {
        static let fullStar = "star.fill"
        static let emptyStar = "star"
        static let halfStar = "star.leadinghalf.filled"
    }
}
