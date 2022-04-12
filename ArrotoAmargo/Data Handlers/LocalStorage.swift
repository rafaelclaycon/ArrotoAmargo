//
//  LocalStorage.swift
//  ArrotoAmargo
//
//  Created by Rafael Schmitt on 06/07/21.
//

import Foundation
import SQLite

class LocalStorage {

    private var db: Connection
    private var cervejas = Table("cerveja")
    private var estilos = Table("estilo")
    private var cervejarias = Table("cervejaria")
    private var avaliacoes = Table("avaliacao")
    private var proprietarios = Table("proprietario")
    private var marcas = Table("marca")
    private var imagens = Table("imagem")
    private var locais = Table("local")

    // MARK: - Init

    init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .cachesDirectory, .userDomainMask, true
        ).first!

        do {
            db = try Connection("\(path)/db.sqlite3")
            try criarCervejas()
            try criarEstilos()
            try criarCervejarias()
            try criarAvaliacoes()
            try criarProprietarios()
            try criarMarcas()
            try criarImagens()
            try criarLocais()
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    private func criarCervejas() throws {
        let id = Expression<String>("id")
        let nome = Expression<String>("nome")
        let nota = Expression<Int64?>("nota")
        let ibu = Expression<Float64>("ibu")
        let teorAlcoolico = Expression<Float64>("teorAlcoolico")
        let estilo = Expression<Int64>("estilo")
        let cor = Expression<Float64?>("cor")
        let dataAdicao = Expression<Date>("dataAdicao")
        
        try db.run(cervejas.create(ifNotExists: true) { t in
            t.column(id, primaryKey: true)
            t.column(nome)
            t.column(nota)
            t.column(ibu)
            t.column(teorAlcoolico)
            t.column(estilo)
            t.column(cor)
            t.column(dataAdicao)
        })
    }
    
    private func criarEstilos() throws {
        let id = Expression<String>("id")
        let nome = Expression<String>("nome")
        
        try db.run(estilos.create(ifNotExists: true) { t in
            t.column(id, primaryKey: true)
            t.column(nome)
        })
    }
    
    private func criarCervejarias() throws {
        let id = Expression<String>("id")
        let razaoSocial = Expression<String>("razaoSocial")
        let idLocal = Expression<String>("idLocal")

        try db.run(cervejarias.create(ifNotExists: true) { t in
            t.column(id, primaryKey: true)
            t.column(razaoSocial)
            t.column(idLocal)
        })
    }

    private func criarAvaliacoes() throws {
        let id = Expression<String>("id")
        let dataHoraRegistro = Expression<Date>("dataHoraRegistro")
        let localConsumo = Expression<String>("localConsumo")
        let nota = Expression<Int>("nota")
        let anotacoes = Expression<String>("anotacoes")
        //let idsFotos = Expression<String>("idsFotos")

        try db.run(avaliacoes.create(ifNotExists: true) { t in
            t.column(id, primaryKey: true)
            t.column(dataHoraRegistro)
            t.column(localConsumo)
            t.column(nota)
            t.column(anotacoes)
            //t.column(idsFotos)
        })
    }
    
    private func criarProprietarios() throws {
        let id = Expression<String>("id")
        let nome = Expression<String>("nome")

        try db.run(proprietarios.create(ifNotExists: true) { t in
            t.column(id, primaryKey: true)
            t.column(nome)
        })
    }
    
    private func criarMarcas() throws {
        let id = Expression<String>("id")
        let nome = Expression<String>("nome")
        let idProprietario = Expression<String>("idProprietario")
        let idImagemLogo = Expression<String>("idImagemLogo")
        let enderecoSede = Expression<String>("enderecoSede")
        
        try db.run(marcas.create(ifNotExists: true) { t in
            t.column(id, primaryKey: true)
            t.column(nome)
            t.column(idProprietario)
            t.column(idImagemLogo)
            t.column(enderecoSede)
        })
    }
    
    private func criarImagens() throws {
        let id = Expression<String>("id")
        let imagem = Expression<Blob>("imagem")

        try db.run(imagens.create(ifNotExists: true) { t in
            t.column(id, primaryKey: true)
            t.column(imagem)
        })
    }
    
    private func criarLocais() throws {
        let id = Expression<String>("id")
        let latitude = Expression<Double>("latitude")
        let longitude = Expression<Double>("longitude")
        let cidade = Expression<String>("cidade")
        let uf = Expression<String>("uf")
        let pais = Expression<String>("pais")

        try db.run(imagens.create(ifNotExists: true) { t in
            t.column(id, primaryKey: true)
            t.column(latitude)
            t.column(longitude)
            t.column(cidade)
            t.column(uf)
            t.column(pais)
        })
    }
    
    // MARK: - Generic query functions
    
    func getCount(of tableName: String) throws -> Int {
        guard tableName.isEmpty == false else {
            throw NSError(domain: "Unable to add row into empty table name.", code: 0, userInfo: nil)
        }
        let table = Table(tableName)
        return try db.scalar(table.count)
    }
    
    func insert<T: Encodable>(_ newRow: T, into tableName: String) throws {
        guard tableName.isEmpty == false else {
            throw NSError(domain: "Unable to add row into empty table name.", code: 0, userInfo: nil)
        }
        let table = Table(tableName)
        
        let insert = try table.insert(newRow)
        try db.run(insert)
    }
    
    func deleteAll(from tableName: String) throws {
        guard tableName.isEmpty == false else {
            throw NSError(domain: "Unable to add row into empty table name.", code: 0, userInfo: nil)
        }
        let table = Table(tableName)
        try db.run(table.delete())
    }

    // MARK: - Cerveja

//    func getAllCervejas() throws -> [Cerveja] {
//        var queriedCervejas = [Cerveja]()
//
//        for cerveja in try db.prepare(cervejas) {
//            queriedCervejas.append(try cerveja.decode())
//        }
//        return queriedCervejas
//    }
    
    // MARK: - Estilo

//    func getAllEstilos() throws -> [EstiloCerveja] {
//        var queriedEstilos = [EstiloCerveja]()
//
//        for estilo in try db.prepare(estilos) {
//            queriedEstilos.append(try estilo.decode())
//        }
//        return queriedEstilos
//    }
    
    // MARK: - Cervejaria

//    func getAllCervejarias() throws -> [Cervejaria] {
//        var queriedRows = [Cervejaria]()
//
//        for row in try db.prepare(cervejarias) {
//            queriedRows.append(try row.decode())
//        }
//        return queriedRows
//    }

    // MARK: - Avaliações

    /*func getAllEpisodes(forID idPodcast: Int) throws -> [Episodio] {
        var queriedEpisodes = [Episodio]()

        let id_podcast = Expression<Int>("idPodcast")
        let query = episodios.filter(id_podcast == idPodcast)

        for episode in try db.prepare(query) {
            queriedEpisodes.append(try episode.decode())
        }
        return queriedEpisodes
    }

    func deleteAllEpisodes() throws {
        try db.run(episodios.delete())
    }

    func updateLocalFilePath(forEpisode idEpisodio: String, with caminho: String) {
        let id = Expression<String>("id")
        let episodio = episodios.filter(id == idEpisodio)
        let caminho_local = Expression<String?>("caminhoLocal")
        do {
            if try db.run(episodio.update(caminho_local <- caminho)) > 0 {
                print("Episódio \(idEpisodio) atualizado com o caminho: \(caminho)")
            } else {
                print("Episódio \(idEpisodio) não encontrado.")
            }
        } catch {
            print("falha ao tentar atualizar: \(error)")
        }
    }*/

}
