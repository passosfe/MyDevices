//
//  HomeView.swift
//  MyDevices
//
//  Created by Felipe Passos on 22/04/22.
//

import SwiftUI

struct HomeView<ViewModel>: View where ViewModel: HomeViewModelProtocol {
    
    // MARK: - Typealias
        
    private typealias Colors = HomeConstants.Colors
    private typealias Strings = HomeConstants.Strings
    private typealias Sizes = HomeConstants.Sizes
    private typealias ImageNames = HomeConstants.ImageNames
    
    //MARK: - Properties
    
    @ObservedObject var viewModel: ViewModel
    @State var selectedDevice: Device?
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                Group {
                    if viewModel.isSearching && !viewModel.isLoading {
                        Text(viewModel.searchResultsAmmount)
                            .font(.title3)
                            .bold()
                    } else if viewModel.isLoading {
                        ProgressView()
                    }
                }
                .padding(.top)
                
                VStack {
                    ForEach(viewModel.devices) { device in
                        DeviceItemView(for: device)
                            .padding([.horizontal, .bottom])
                    }
                }
                .padding(.top)
            }
            .redacted(reason: viewModel.isLoading ? .placeholder : [])
            .searchable(text: $viewModel.searchText)
            .navigationTitle(Strings.title)
        }
        .sheet(item: $selectedDevice) { selectedDevice in
            DeviceDetailView(viewModel: DeviceViewModel(deviceId: selectedDevice.id))
        }
    }
}

extension HomeView {
    @ViewBuilder
    private func DeviceItemView(for device: Device) -> some View {
        HStack {
            Image(systemName: ImageNames.phone)
                .font(.headline)
                .foregroundColor(Colors.subtitleColor)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(device.brand) \(device.model)")
                    .font(.title3)
                    .bold()
                
                Text("\(Strings.status) \(device.status.rawValue)")
                    .font(.headline)
                    .foregroundColor(Colors.subtitleColor)
            }
        }
        .padding(.horizontal)
        .padding()
        .background(
            Colors.cardBackground
                .cornerRadius(Sizes.cardCornerRadius)
        )
        .onTapGesture {
            self.selectedDevice = device
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = HomeViewModel()
        HomeView(viewModel: viewModel)
    }
}
