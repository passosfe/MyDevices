//
//  DeviceDetailView.swift
//  MyDevices
//
//  Created by Felipe Passos on 22/04/22.
//

import SwiftUI

struct DeviceDetailView<ViewModel>: View where ViewModel: DeviceViewModelProtocol {
    //MARK: - Properties
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    AsyncImage(url: viewModel.imageURL) { image in
                        image.resizable()
                    } placeholder: {
                        Color.red
                    }
                    .frame(width: 128, height: 128)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    
                    VStack {
                        Text("Name: \(viewModel.title)")
                        
                        Text("OS: \(viewModel.os)")
                        
                        Text("Status: \(viewModel.status)")
                        
                        Text("Size: \(viewModel.screenResolution)")
                        
                        HStack {
                            Text("Stars :")
                            
                            ForEach(0 ..< viewModel.fullStars) { _ in
                                Image(systemName: "star.fill")
                            }
                            
                            ForEach(0 ..< viewModel.halfStars) { _ in
                                Image(systemName: "star.leadinghalf.filled")
                            }
                            
                            ForEach(0 ..< viewModel.emptyStars) { _ in
                                Image(systemName: "star")
                            }
                        }
                    }
                    .padding()
                    .background(
                        Color.gray
                            .cornerRadius(25)
                    )
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 5, y: 5)
                }
                .redacted(reason: viewModel.isLoading ? .placeholder : [])
                .frame(maxWidth: .infinity)
            }
            .navigationTitle(viewModel.title)
            .navigationBarItems(trailing:
                                    Image(systemName: viewModel.favoriteIcon)
                                    .padding()
                                    .onTapGesture {
                                        viewModel.toggleFavorite()
                                    }
            )

        }
    }
}

struct DeviceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = DeviceViewModel(deviceId: "1")
        DeviceDetailView(viewModel: viewModel)
    }
}
