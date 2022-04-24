//
//  DeviceViewModelSpec.swift
//  MyDevicesTests
//
//  Created by Felipe Passos on 23/04/22.
//

import XCTest
import Combine
@testable import MyDevices

class DeviceViewModel_Tests: XCTestCase {

    var viewModel: DeviceViewModel!
    var deviceService: DeviceServiceMock!
    private var cancellables: [AnyCancellable] = [AnyCancellable]()
    
    var testData: [Device] = [
        .init(id: "1", isFavorite: false, imageURL: "image1", brand: "Samsung", model: "Galaxy", os: "Android 10", screenResolution: "1900 x 800", stars: 4, status: .available),
        .init(id: "2", isFavorite: true, imageURL: "image2", brand: "Apple", model: "iPhone", os: "iOS 15", screenResolution: "1400 x 750", stars: 4.5, status: .unavailable)
        ]

    override func setUp() {
        deviceService = DeviceServiceMock()
        deviceService.devices = testData
        viewModel = .init(deviceId: "2", deviceService: deviceService)
    }

    func test_whenViewModelRetrieveDeviceInfo_thenViewModelContainDeviceInfo() {
        let expectation = expectation(description: "Wait for device response")
        
        viewModel.$device
            .dropFirst()
            .sink { returnedItem in
                expectation.fulfill()
            }.store(in: &cancellables)
        
        waitForExpectations(timeout: 3, handler: nil)
        
        XCTAssertEqual(viewModel.id, "2")
        XCTAssertEqual(viewModel.title, "Apple iPhone")
        XCTAssertEqual(viewModel.status, "unavailable")
        XCTAssertEqual(viewModel.favoriteIcon, DeviceConstants.ImageNames.fullStar)
        XCTAssertEqual(viewModel.os, "iOS 15")
        XCTAssertEqual(viewModel.screenResolution, "1400 x 750")
        XCTAssertEqual(viewModel.starIcons, [
            DeviceConstants.ImageNames.fullStar,
            DeviceConstants.ImageNames.fullStar,
            DeviceConstants.ImageNames.fullStar,
            DeviceConstants.ImageNames.fullStar,
            DeviceConstants.ImageNames.halfStar
        ])
    }
}
