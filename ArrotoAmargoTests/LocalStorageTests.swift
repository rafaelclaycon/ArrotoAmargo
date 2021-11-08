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

    override func setUpWithError() throws {
        XCTAssertEqual(try storage.getCount(of: TableName.cerveja), 0)
        XCTAssertEqual(try storage.getCount(of: TableName.estilo), 0)
        XCTAssertEqual(try storage.getCount(of: TableName.cervejaria), 0)
    }

    override func tearDownWithError() throws {
        XCTAssertNoThrow(try storage.deleteAll(from: TableName.cerveja))
        XCTAssertNoThrow(try storage.deleteAll(from: TableName.estilo))
        XCTAssertNoThrow(try storage.deleteAll(from: TableName.cervejaria))
    }
    
    // MARK: - Cervejas
    
    func test_insertCervejasIntoDB_shouldReturnCorrectCount() throws {
        let cervejas = ArrotoAmargoService.getCervejas()
        for cerveja in cervejas {
            XCTAssertNoThrow(try storage.insert(cerveja, into: TableName.cerveja))
        }
        XCTAssertEqual(try storage.getCount(of: TableName.cerveja), 13)
    }
    
    // MARK: - Estilos
    
    func test_insertEstilosIntoDB_shouldReturnCorrectCount() throws {
        let estilos = ArrotoAmargoService.getEstilos()
        for estilo in estilos {
            XCTAssertNoThrow(try storage.insert(estilo, into: TableName.estilo))
        }
        XCTAssertEqual(try storage.getCount(of: TableName.estilo), 7)
    }
    
    // MARK: - Cervejarias
    
    func test_insertCervejariasIntoDB_shouldReturnCorrectCount() throws {
        let cervejarias = ArrotoAmargoService.getCervejarias()
        for cervejaria in cervejarias {
            XCTAssertNoThrow(try storage.insert(cervejaria, into: TableName.cervejaria))
        }
        XCTAssertEqual(try storage.getCount(of: TableName.cervejaria), 5)
    }

}
