//
//  HomeView.swift
//  MyDevices
//
//  Created by Felipe Passos on 22/04/22.
//

import SwiftUI

struct HomeView<ViewModel>: View where ViewModel: HomeViewModelProtocol {
    
    //MARK: - Properties
    
    @ObservedObject var viewModel: ViewModel
    @State var selectedDevice: Device?
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(viewModel.devices) { device in
                        DeviceItemView(for: device)
                            .padding([.horizontal, .bottom])
                    }
                }
                .padding(.top)
            }
            .searchable(text: $viewModel.searchText)
            .navigationTitle("Home")
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
            Image(systemName: "iphone")
            
            Spacer()
            
            VStack {
                Text("\(device.brand) \(device.model)")
                
                Text("Status: \(device.status.rawValue)")
            }
        }
        .padding()
        .background(
            Color.gray
                .cornerRadius(25)
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
