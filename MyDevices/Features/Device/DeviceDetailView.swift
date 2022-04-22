//
//  DeviceDetailView.swift
//  MyDevices
//
//  Created by Felipe Passos on 22/04/22.
//

import SwiftUI

struct DeviceDetailView<ViewModel>: View where ViewModel: DeviceViewModelProtocol {
    
    // MARK: - Typealias
        
    private typealias Colors = DeviceConstants.Colors
    private typealias Strings = DeviceConstants.Strings
    private typealias Sizes = DeviceConstants.Sizes
    
    //MARK: - Properties
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack {
                        AsyncImage(url: viewModel.imageURL) { image in
                            image.resizable()
                        } placeholder: {
                            Colors.cardBackground
                        }
                        .frame(width: Sizes.imageWidth, height: Sizes.imageHeight)
                        .clipShape(RoundedRectangle(cornerRadius: Sizes.cornerRadius))
                        .offset(y: Sizes.imageOffset)
                        .padding(.top, Sizes.imagePaddingTop)
                        .padding(.bottom, Sizes.imagePaddingBottom)
                        
                        DeviceInformation()
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        Colors.cardBackground
                            .cornerRadius(Sizes.cornerRadius)
                    )
                    .shadow(color: Colors.shadow, radius: Sizes.shadowRadius, x: Sizes.shadowX, y: Sizes.shadowY)
                }
                .padding([.horizontal, .bottom])
                .padding(.top, Sizes.topPadding)
                .redacted(reason: viewModel.isLoading ? .placeholder : [])
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

extension DeviceDetailView {
    @ViewBuilder
    private func DeviceInformation() -> some View {
        Group {
            Text(Strings.name)
                .font(.title3)
                .bold()
                .unredacted()
            Text(viewModel.title)
                .font(.headline)
                .foregroundColor(Colors.subtitleForegroundColor)
                .padding(.bottom)
            
            Text(Strings.os)
                .font(.title3)
                .bold()
                .unredacted()
            Text(viewModel.os)
                .font(.headline)
                .foregroundColor(Colors.subtitleForegroundColor)
                .padding(.bottom)
            
            Text(Strings.status)
                .font(.title3)
                .bold()
                .unredacted()
            Text(viewModel.status)
                .font(.headline)
                .foregroundColor(Colors.subtitleForegroundColor)
                .padding(.bottom)
            
            Text(Strings.size)
                .font(.title3)
                .bold()
                .unredacted()
            Text(viewModel.screenResolution)
                .font(.headline)
                .foregroundColor(Colors.subtitleForegroundColor)
                .padding(.bottom)
            
            Text(Strings.stars)
                .font(.title3)
                .bold()
                .unredacted()
            
            HStack {
                ForEach(viewModel.starIcons, id: \.self) { icon in
                    Image(systemName: icon)
                        .font(.headline)
                        .foregroundColor(Colors.subtitleForegroundColor)
                }
            }
        }
    }
}

struct DeviceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = DeviceViewModel(deviceId: "1")
        DeviceDetailView(viewModel: viewModel)
    }
}
