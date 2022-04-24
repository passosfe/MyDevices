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
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            Colors.cardBackground
                        }
                        .frame(height: Sizes.imageHeight)
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
            .navigationBarItems(trailing: FavouriteButton())

        }
    }
}

extension DeviceDetailView {
    @ViewBuilder
    private func FavouriteButton() -> some View {
        ZStack {
            Image(systemName: viewModel.favoriteIcon)
            .padding()
            .onTapGesture {
                if !viewModel.isLoadingFavourite {
                    viewModel.toggleFavorite()
                }
            }
            .opacity(viewModel.isLoadingFavourite ? 0.1 : 1)
            .accessibilityLabel(Strings.favouriteIconAccessibility)

            if viewModel.isLoadingFavourite {
                ProgressView()
            }
        }
    }
}

extension DeviceDetailView {
    @ViewBuilder
    private func DeviceInformation() -> some View {
        Group {
            SectionTitle(Strings.name)
            SectionSubtitle(viewModel.title)
            
            SectionTitle(Strings.os)
            SectionSubtitle(viewModel.os)
            
            SectionTitle(Strings.status)
            SectionSubtitle(viewModel.status)
            
            SectionTitle(Strings.size)
            SectionSubtitle(viewModel.screenResolution)
            
            SectionTitle(Strings.stars)
            
            HStack {
                ForEach(viewModel.starIcons, id: \.self) { icon in
                    Image(systemName: icon)
                        .font(.headline)
                        .foregroundColor(Colors.subtitleForegroundColor)
                }
            }
        }
    }
    
    @ViewBuilder
    private func SectionTitle(_ text: String) -> some View {
        Text(text)
            .font(.title3)
            .bold()
            .unredacted()
    }
    
    @ViewBuilder
    private func SectionSubtitle(_ text: String) -> some View {
        Text(text)
            .font(.headline)
            .foregroundColor(Colors.subtitleForegroundColor)
            .padding(.bottom)
    }
}

struct DeviceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = DeviceViewModel(deviceId: "1")
        DeviceDetailView(viewModel: viewModel)
    }
}
