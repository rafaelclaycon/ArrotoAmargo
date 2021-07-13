//
//  ArrotoAmargoTests.swift
//  ArrotoAmargoTests
//
//  Created by Rafael Schmitt on 08/07/20.
//

import XCTest
@testable import ArrotoAmargo

class LocalStorageTests: XCTestCase {
    
    let storage = LocalStorage()
    let testCervejas: [Cerveja]? = nil

    override func setUpWithError() throws {
        XCTAssertEqual(try storage.getCervejaCount(), 0)
    }

    override func tearDownWithError() throws {
        XCTAssertNoThrow(try storage.deleteAllCervejas())
    }

    func testInsertCervejasIntoDB() throws {
        let cervejas = ArrotoAmargoService.getCervejas()
        for cerveja in cervejas {
            XCTAssertNoThrow(try storage.insert(cerveja: cerveja))
        }
        XCTAssertEqual(try storage.getAllCervejas().count, 13)
    }

}
