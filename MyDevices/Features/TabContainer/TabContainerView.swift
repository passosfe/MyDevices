//
//  TabContainerView.swift
//  MyDevices
//
//  Created by Felipe Passos on 22/04/22.
//

import SwiftUI

struct TabContainerView: View {
    // MARK: - Typealias
        
    private typealias Tabs = TabContainerConstants.Tabs
    
    //MARK: - Properties
    
    @ObservedObject var viewModel: TabContainerViewModel = TabContainerViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            ForEach(Tabs.items, id: \.self) { item in
                tabView(for: item.type)
                    .tabItem {
                        Image(systemName: item.imageName)
                        Text(item.title)
                    }
                    .tag(item.type)
            }
        }
    }
    
    @ViewBuilder
        private func tabView(for item: TabItem.TabItemType) -> some View {
            switch item {
            case .home:
                HomeView(viewModel: HomeViewModel())
            case .myDevices:
                Text("B")
            case .settings:
                Text("C")
            }
        }

}

struct TabContainerView_Previews: PreviewProvider {
    static var previews: some View {
        TabContainerView()
    }
}
