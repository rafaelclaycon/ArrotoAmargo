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
        XCTAssertEqual(try storage.getEstiloCount(), 0)
        XCTAssertEqual(try storage.getCervejariaCount(), 0)
    }

    override func tearDownWithError() throws {
        XCTAssertNoThrow(try storage.deleteAllCervejas())
        XCTAssertNoThrow(try storage.deleteAllEstilos())
        XCTAssertNoThrow(try storage.deleteAllCervejarias())
    }
    
    // MARK: - Cervejas
    
    func test_insertCervejasIntoDB_shouldReturnCorrectCount() throws {
        let cervejas = ArrotoAmargoService.getCervejas()
        for cerveja in cervejas {
            XCTAssertNoThrow(try storage.insert(cerveja: cerveja))
        }
        XCTAssertEqual(try storage.getAllCervejas().count, 13)
    }
    
    // MARK: - Estilos
    
    func test_insertEstilosIntoDB_shouldReturnCorrectCount() throws {
        let estilos = ArrotoAmargoService.getEstilos()
        for estilo in estilos {
            XCTAssertNoThrow(try storage.insert(estilo: estilo))
        }
        XCTAssertEqual(try storage.getAllEstilos().count, 7)
    }
    
    // MARK: - Cervejarias
    
    func test_insertCervejariasIntoDB_shouldReturnCorrectCount() throws {
        let cervejarias = ArrotoAmargoService.getCervejarias()
        for cervejaria in cervejarias {
            XCTAssertNoThrow(try storage.insert(cervejaria: cervejaria))
        }
        XCTAssertEqual(try storage.getAllCervejarias().count, 5)
    }

}
