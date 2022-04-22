//
//  MockDeviceData.swift
//  MyDevices
//
//  Created by Felipe Passos on 22/04/22.
//

import Foundation

public enum MockDeviceData {
    static var devices: [Device] = [
        .init(id: "1", isFavorite: false, imageURL: "https://w7.pngwing.com/pngs/161/647/png-transparent-samsung-galaxy-s8-plus-64gb-zilver-telephone-smartphone-midnight-black-samsung-gadget-computer-wallpaper-mobile-phone.png", brand: "Samsung", model: "Galaxy", os: "Android 10", screenResolution: "1900 x 800", stars: 4, status: .available),
        .init(id: "2", isFavorite: false, imageURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2F1valet.com%2F&psig=AOvVaw3Z5q94Cyedz6cfd0gSmkHa&ust=1650716572001000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCLDfqs_Up_cCFQAAAAAdAAAAABAD", brand: "Samsung", model: "Galaxy", os: "Android 10", screenResolution: "1900 x 800", stars: 4.5, status: .available),
        .init(id: "3", isFavorite: false, imageURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2F1valet.com%2F&psig=AOvVaw3Z5q94Cyedz6cfd0gSmkHa&ust=1650716572001000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCLDfqs_Up_cCFQAAAAAdAAAAABAD", brand: "Samsung", model: "Galaxy", os: "Android 10", screenResolution: "1900 x 800", stars: 2, status: .available),
        .init(id: "4", isFavorite: false, imageURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2F1valet.com%2F&psig=AOvVaw3Z5q94Cyedz6cfd0gSmkHa&ust=1650716572001000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCLDfqs_Up_cCFQAAAAAdAAAAABAD", brand: "Samsung", model: "Galaxy", os: "Android 10", screenResolution: "1900 x 800", stars: 3.5, status: .available)
    ]
    
    // Note: Temporary data just so the redacted modifier has items to show the shimmer effect. This makes sure the temporary array and the API array are different
    static var temporaryData: [Device] = [
        .init(id: "1", isFavorite: false, imageURL: "https://w7.pngwing.com/pngs/161/647/png-transparent-samsung-galaxy-s8-plus-64gb-zilver-telephone-smartphone-midnight-black-samsung-gadget-computer-wallpaper-mobile-phone.png", brand: "Samsung", model: "Galaxy", os: "Android 10", screenResolution: "1900 x 800", stars: 4, status: .available),
        .init(id: "2", isFavorite: false, imageURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2F1valet.com%2F&psig=AOvVaw3Z5q94Cyedz6cfd0gSmkHa&ust=1650716572001000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCLDfqs_Up_cCFQAAAAAdAAAAABAD", brand: "Samsung", model: "Galaxy", os: "Android 10", screenResolution: "1900 x 800", stars: 4.5, status: .available),
        .init(id: "3", isFavorite: false, imageURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2F1valet.com%2F&psig=AOvVaw3Z5q94Cyedz6cfd0gSmkHa&ust=1650716572001000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCLDfqs_Up_cCFQAAAAAdAAAAABAD", brand: "Samsung", model: "Galaxy", os: "Android 10", screenResolution: "1900 x 800", stars: 2, status: .available),
        .init(id: "4", isFavorite: false, imageURL: "https://www.google.com/url?sa=i&url=https%3A%2F%2F1valet.com%2F&psig=AOvVaw3Z5q94Cyedz6cfd0gSmkHa&ust=1650716572001000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCLDfqs_Up_cCFQAAAAAdAAAAABAD", brand: "Samsung", model: "Galaxy", os: "Android 10", screenResolution: "1900 x 800", stars: 3.5, status: .available)
    ]
}
