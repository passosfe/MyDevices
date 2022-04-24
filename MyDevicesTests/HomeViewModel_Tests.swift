//
//  HomeViewModelSpec.swift
//  MyDevicesTests
//
//  Created by Felipe Passos on 23/04/22.
//

import XCTest
import Combine
@testable import MyDevices

class HomeViewModel_Tests: XCTestCase {
    
    var viewModel: HomeViewModel!
    var deviceService: DeviceServiceMock!
    private var cancellables: [AnyCancellable] = [AnyCancellable]()
    
    var testData: [Device] = [
        .init(id: "1", isFavorite: false, imageURL: "image1", brand: "Samsung", model: "Galaxy", os: "Android 10", screenResolution: "1900 x 800", stars: 4, status: .available),
        .init(id: "2", isFavorite: true, imageURL: "image2", brand: "Apple", model: "iPhone", os: "iOS 15", screenResolution: "1400 x 750", stars: 4.5, status: .unavailable)
        ]

    override func setUp() {
        deviceService = DeviceServiceMock()
        deviceService.devices = testData
        viewModel = .init(deviceService: deviceService)
    }

    func test_whenViewModelRetrieveResults_thenViewModelContainDevicesList() {
        let expectation = expectation(description: "Wait for devices response")
        
        viewModel.$devices
            .dropFirst()
            .sink { returnedItem in
                expectation.fulfill()
            }.store(in: &cancellables)
        
        waitForExpectations(timeout: 3, handler: nil)
        
        XCTAssertEqual(viewModel.devices.count, 2)
        XCTAssertEqual(viewModel.devices.first?.id, "1")
        XCTAssertEqual(viewModel.devices[1].model, "iPhone")
    }
    
    func test_whenSearchTextChanges_thenResultsShouldChangeAccordingly() {
        viewModel.searchText = "ipho"
        let expectation = expectation(description: "Wait for devices response")
        
        viewModel.$devices
            .dropFirst(2)
            .sink { returnedItem in
                expectation.fulfill()
            }.store(in: &cancellables)
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(viewModel.devices.count, 1)
        XCTAssertEqual(viewModel.devices.first?.id, "2")
        XCTAssertEqual(viewModel.devices.first?.model, "iPhone")
    }

    func test_whenRetrieveResult_thenIsLoadingStateShouldBeFalse() {
        viewModel.searchText = "ipho"
        let expectation = expectation(description: "Wait for devices response")
        
        viewModel.$devices
            .dropFirst(2)
            .sink { returnedItem in
                expectation.fulfill()
            }.store(in: &cancellables)
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertFalse(viewModel.isLoading)
    }
    
    func test_whenSearchTextChanges_thenResultsAmmountShouldChangeAccordingly() {
        viewModel.searchText = "app"
        let expectation = expectation(description: "Wait for devices response")
        
        viewModel.$devices
            .dropFirst(2)
            .sink { returnedItem in
                expectation.fulfill()
            }.store(in: &cancellables)
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertEqual(viewModel.searchResultsAmmount, HomeConstants.Strings.resultsAmmount.replacingOccurrences(of: HomeConstants.Strings.resultsAmmountPlaceholder, with: "1"))
    }
}
