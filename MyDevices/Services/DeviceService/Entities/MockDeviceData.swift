//
//  MockDeviceData.swift
//  MyDevices
//
//  Created by Felipe Passos on 22/04/22.
//

import Foundation

public enum MockDeviceData {
    static var devices: [Device] = [
        .init(id: "1", isFavorite: false, imageURL: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-13-pro-max-silver-select?wid=940&hei=1112&fmt=png-alpha&.v=1645552346280", brand: "Apple", model: "iPhone 13 Pro", os: "iOS 15", screenResolution: "1284 x 2778", stars: 4, status: .available),
        .init(id: "2", isFavorite: true, imageURL: "https://files.tecnoblog.net/wp-content/uploads/2021/01/galaxy-s21-produto-700x700.png", brand: "Samsung", model: "Galaxy S21", os: "Android 11", screenResolution: "1440 x 3200", stars: 4.5, status: .available),
        .init(id: "3", isFavorite: false, imageURL: "https://files.tecnoblog.net/wp-content/uploads/2021/09/iphone-13-produto-2-700x700.png", brand: "Apple", model: "iPhone 13", os: "iOS 15", screenResolution: "1170 x 2532", stars: 2, status: .available),
        .init(id: "4", isFavorite: true, imageURL: "https://www.giztop.com/media/catalog/product/cache/dc206057cdd42d7e34b9d36e347785ca/x/i/xiaomi_mi_11_pro_black_2_1_1.png", brand: "Xiaomi", model: "Mi 11 Pro", os: "Android 11", screenResolution: "1440 x 3200", stars: 3.5, status: .available),
        .init(id: "5", isFavorite: false, imageURL: "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-13-starlight-select-2021?wid=940&hei=1112&fmt=png-alpha&.v=1645572315205", brand: "Apple", model: "iPhone 13", os: "iOS 15", screenResolution: "1080 x 2340", stars: 4, status: .available),
        .init(id: "6", isFavorite: true, imageURL: "https://oasis.opstatics.com/content/dam/oasis/page/2021/9-series/spec-image/9-pro/Stellar%20Black-gallery..png", brand: "OnePlus", model: "9 Pro", os: "Android 11", screenResolution: "1440 x 3216", stars: 4.5, status: .available),
        .init(id: "8", isFavorite: true, imageURL: "https://themayanagari.com/wp-content/uploads/2021/04/Xiaomi-Mi-11-Ultra-2.png", brand: "Xiaomi", model: "Mi 11 Ultra", os: "Android 11", screenResolution: "1440 x 3200", stars: 3.5, status: .available),
        .init(id: "9", isFavorite: true, imageURL: "https://pngimg.com/uploads/iphone_12/iphone_12_PNG19.png", brand: "Apple", model: "iPhone 12 Pro", os: "iOS 14", screenResolution: "1284 x 2778", stars: 4, status: .available),
        .init(id: "10", isFavorite: false, imageURL: "https://images.samsung.com/is/image/samsung/br/galaxy-s20/gallery/br-silicone-cover-galaxy-s20-plus-ef-pg985tjegbr-frontgray-207993876?$720_576_PNG$", brand: "Samsung", model: "Galaxy S20", os: "Android 11", screenResolution: "1440 x 3200", stars: 4.5, status: .available),
        .init(id: "11", isFavorite: false, imageURL: "https://dlcdnwebimgs.asus.com/gain/4c455898-c844-468b-bbd3-73d0640b6ce9/", brand: "Asus", model: "Zenfone 8", os: "Android 11", screenResolution: "1080 x 2400", stars: 2, status: .available),
        .init(id: "12", isFavorite: true, imageURL: "https://www.kabum.com.br/conteudo/descricao/308572/img/Moto_E7_1.png", brand: "Motorola", model: "Edge 10", os: "Android 11", screenResolution: "1080 x 2400", stars: 3.5, status: .available),
        .init(id: "13", isFavorite: false, imageURL: "https://pngimg.com/uploads/iphone_12/iphone_12_PNG17.png", brand: "Apple", model: "iPhone 12", os: "iOS14", screenResolution: "1170 x 2532", stars: 4, status: .available),
        .init(id: "15", isFavorite: true, imageURL: "https://oasis.opstatics.com/content/dam/oasis/page/2021/9-series/spec-image/9-pro/Stellar%20Black-gallery..png", brand: "OnePlus", model: "9 Pro", os: "Android 10", screenResolution: "1440 x 3168", stars: 2, status: .available)
        
    ]
    
    // Note: Temporary data just so the redacted modifier has items to show the shimmer effect. This makes sure the temporary array and the API array are different
    static var temporaryData: [Device] = [
        .init(id: "1", isFavorite: false, imageURL: "", brand: "Samsung", model: "Galaxy", os: "Android 10", screenResolution: "1900 x 800", stars: 4, status: .available),
        .init(id: "2", isFavorite: false, imageURL: "", brand: "Samsung", model: "Galaxy", os: "Android 10", screenResolution: "1900 x 800", stars: 4.5, status: .available),
        .init(id: "3", isFavorite: false, imageURL: "", brand: "Samsung", model: "Galaxy", os: "Android 10", screenResolution: "1900 x 800", stars: 2, status: .available),
        .init(id: "4", isFavorite: false, imageURL: "", brand: "Samsung", model: "Galaxy", os: "Android 10", screenResolution: "1900 x 800", stars: 3.5, status: .available),
        .init(id: "5", isFavorite: false, imageURL: "", brand: "Samsung", model: "Galaxy", os: "Android 10", screenResolution: "1900 x 800", stars: 4, status: .available),
        .init(id: "6", isFavorite: false, imageURL: "", brand: "Samsung", model: "Galaxy", os: "Android 10", screenResolution: "1900 x 800", stars: 4.5, status: .available),
        .init(id: "7", isFavorite: false, imageURL: "", brand: "Samsung", model: "Galaxy", os: "Android 10", screenResolution: "1900 x 800", stars: 2, status: .available),
        .init(id: "8", isFavorite: false, imageURL: "", brand: "Samsung", model: "Galaxy", os: "Android 10", screenResolution: "1900 x 800", stars: 3.5, status: .available)
        
    ]
}
