//
//  TabContainerViewConstants.swift
//  MyDevices
//
//  Created by Felipe Passos on 22/04/22.
//

import Foundation

public enum TabContainerConstants {
    enum Tabs {
        static let items: [TabItem] = [
            .init(imageName: "house", title: "Home", type: .home),
            .init(imageName: "iphone", title: "My Devices", type: .myDevices),
            .init(imageName: "gear", title: "Settings", type: .settings)
        ]
    }
    
    enum Strings {
        static let myDevices = "My Devices"
        static let settings = "Settings"
    }
}
