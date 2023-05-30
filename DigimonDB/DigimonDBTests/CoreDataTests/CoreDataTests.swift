//
//  CoreDataTests.swift
//  DigimonDBTests
//
//  Created by Taijaun Pitt on 30/05/2023.
//

import XCTest
@testable import DigimonDB
import CoreData

final class CoreDataTests: XCTestCase {
    
    var coreDataStack: TestCoreDataStack!
    var testCoreDataManager: TestCoreDataManager!

//    override func setUp(){
//        super.setUp()
//        coreDataStack = TestCoreDataStack()
//        testCoreDataManager = TestCoreDataManager(mainContext: coreDataStack.mainContext, coreDataStack: coreDataStack)
//    }
    
    func testFetchFavourites() async {
        //Given
        
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
