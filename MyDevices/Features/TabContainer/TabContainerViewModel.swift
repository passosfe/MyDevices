//
//  TabContainerViewModel.swift
//  MyDevices
//
//  Created by Felipe Passos on 22/04/22.
//

import Foundation
import Combine

protocol TabContainerViewModelProtocol: ObservableObject {
    var selectedTab         : TabItem.TabItemType  { get set }
}

final class TabContainerViewModel: TabContainerViewModelProtocol {
    @Published var selectedTab: TabItem.TabItemType = .home
}

struct TabItem: Hashable {
    let imageName: String
    let title: String
    let type: TabItemType
    
    enum TabItemType {
        case home
        case myDevices
        case settings
    }
}

extension TabItem.TabItemType: Identifiable {
    var id: Self { self }
}
