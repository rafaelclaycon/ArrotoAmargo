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
        XCTAssertEqual(try storage.getCount(of: TableName.avaliacao), 0)
        XCTAssertEqual(try storage.getCount(of: TableName.proprietario), 0)
        XCTAssertEqual(try storage.getCount(of: TableName.marca), 0)
    }

    override func tearDownWithError() throws {
        XCTAssertNoThrow(try storage.deleteAll(from: TableName.cerveja))
        XCTAssertNoThrow(try storage.deleteAll(from: TableName.estilo))
        XCTAssertNoThrow(try storage.deleteAll(from: TableName.cervejaria))
        XCTAssertNoThrow(try storage.deleteAll(from: TableName.avaliacao))
        XCTAssertNoThrow(try storage.deleteAll(from: TableName.proprietario))
        XCTAssertNoThrow(try storage.deleteAll(from: TableName.marca))
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
    
    // MARK: - Avaliações
    
    func test_insertAvaliacoesIntoDB_shouldReturnCorrectCount() throws {
        let avaliacoes = ArrotoAmargoService.getAvaliacoes()
        for avaliacao in avaliacoes {
            XCTAssertNoThrow(try storage.insert(avaliacao, into: TableName.avaliacao))
        }
        XCTAssertEqual(try storage.getCount(of: TableName.avaliacao), 5)
    }
    
    // MARK: - Proprietários
    
    func test_insertProprietariosIntoDB_shouldReturnCorrectCount() throws {
        let proprietarios = ArrotoAmargoService.getProprietarios()
        for propietario in proprietarios {
            XCTAssertNoThrow(try storage.insert(propietario, into: TableName.proprietario))
        }
        XCTAssertEqual(try storage.getCount(of: TableName.proprietario), 7)
    }
    
    // MARK: - Marcas
    
    func test_insertMarcasIntoDB_shouldReturnCorrectCount() throws {
        let marcas = ArrotoAmargoService.getMarcas()
        for marca in marcas {
            XCTAssertNoThrow(try storage.insert(marca, into: TableName.marca))
        }
        XCTAssertEqual(try storage.getCount(of: TableName.marca), 7)
    }

}
