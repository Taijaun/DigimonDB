//
//  DigimonCardViewModelTests.swift
//  DigimonDBTests
//
//  Created by Taijaun Pitt on 30/05/2023.
//

import XCTest
@testable import DigimonDB

final class DigimonCardViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        
    }

    func testApiCallWithEverythingCorrect() async throws {
        let coreDataManager = TestCoreDataManager(mainContext: TestCoreDataStack().persistentContainer.viewContext, coreDataStack: TestCoreDataStack())
        XCTAssertNotNil(coreDataManager)
        let digimonViewModel = await DigimonCardViewModel(manager: FakeNetworkManager(), coreDataManager: coreDataManager)
        XCTAssertNotNil(digimonViewModel)
        
        await digimonViewModel.getDigimonList(urlString: "testDigimon", coreDataManager: coreDataManager)
        let digimonTestList = await digimonViewModel.digimonList
        XCTAssertEqual(digimonTestList.count, 1)
        
        let error = await digimonViewModel.customisedError
        XCTAssertNil(error)
    }
    
    func testApiCallWithEmptyJson() async throws {
        let coreDataManager = TestCoreDataManager(mainContext: TestCoreDataStack().persistentContainer.viewContext, coreDataStack: TestCoreDataStack())
        XCTAssertNotNil(coreDataManager)
        let digimonViewModel = await DigimonCardViewModel(manager: FakeNetworkManager(), coreDataManager: coreDataManager)
        XCTAssertNotNil(digimonViewModel)
        
        await digimonViewModel.getDigimonList(urlString: "digimon_Empty", coreDataManager: coreDataManager)
        let digimonTestList = await digimonViewModel.digimonList
        XCTAssertEqual(digimonTestList.count, 0)
        
        let error = await digimonViewModel.customisedError
        XCTAssertNotNil(error)
        XCTAssertEqual(error, NetworkingError.parsingError)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
