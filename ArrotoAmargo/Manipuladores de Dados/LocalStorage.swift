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
    private var avaliacoes = Table("avaliacao")
    private var cervejarias = Table("cervejaria")
    private var marcas = Table("marca")
    private var proprietarios = Table("proprietario")

    // MARK: - Init

    init() {
        let path = NSSearchPathForDirectoriesInDomains(
            .cachesDirectory, .userDomainMask, true
        ).first!

        do {
            db = try Connection("\(path)/db.sqlite3")
            try criarCervejas()
            try criarEstilos()
            try criarAvaliacoes()
            try criarCervejarias()
            try criarMarcas()
            try criarProprietarios()
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

    private func criarAvaliacoes() throws {
        let id = Expression<String>("id")
        let dataHoraRegistro = Expression<Date>("dataHoraRegistro")
        let localConsumo = Expression<String>("localConsumo")
        let nota = Expression<Int>("nota")
        let anotacoes = Expression<String>("anotacoes")
        //let foto = Expression<String>("foto")

        try db.run(avaliacoes.create(ifNotExists: true) { t in
            t.column(id, primaryKey: true)
            t.column(dataHoraRegistro)
            t.column(localConsumo)
            t.column(nota)
            t.column(anotacoes)
            //t.column(foto)
        })
    }
    
    private func criarCervejarias() throws {
        let id = Expression<String>("id")
        let razaoSocial = Expression<String>("razaoSocial")
        let cidade = Expression<String>("cidade")
        let uf = Expression<String>("uf")
        let pais = Expression<String>("pais")

        try db.run(cervejarias.create(ifNotExists: true) { t in
            t.column(id, primaryKey: true)
            t.column(razaoSocial)
            t.column(cidade)
            t.column(uf)
            t.column(pais)
        })
    }
    
    private func criarMarcas() throws {
        let id = Expression<String>("id")
        let nome = Expression<String>("nome")

        try db.run(marcas.create(ifNotExists: true) { t in
            t.column(id, primaryKey: true)
            t.column(nome)
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

    // MARK: - Cervejas

    func getCervejaCount() throws -> Int {
        try db.scalar(cervejas.count)
    }

    func insert(cerveja: Cerveja) throws {
        let insert = try cervejas.insert(cerveja)
        try db.run(insert)
    }

    func getAllCervejas() throws -> [Cerveja] {
        var queriedCervejas = [Cerveja]()

        for cerveja in try db.prepare(cervejas) {
            queriedCervejas.append(try cerveja.decode())
        }
        return queriedCervejas
    }

    func deleteAllCervejas() throws {
        try db.run(cervejas.delete())
    }
    
    // MARK: - Estilos

    func getEstiloCount() throws -> Int {
        try db.scalar(estilos.count)
    }

    func insert(estilo: EstiloCerveja) throws {
        let insert = try estilos.insert(estilo)
        try db.run(insert)
    }

    func getAllEstilos() throws -> [EstiloCerveja] {
        var queriedEstilos = [EstiloCerveja]()

        for estilo in try db.prepare(estilos) {
            queriedEstilos.append(try estilo.decode())
        }
        return queriedEstilos
    }

    func deleteAllEstilos() throws {
        try db.run(estilos.delete())
    }

    // MARK: - Avaliações

    /*func getEpisodeCount() throws -> Int {
        try db.scalar(episodios.count)
    }

    func insert(episode: Episodio) throws {
        let insert = try episodios.insert(episode)
        try db.run(insert)
    }

    func getAllEpisodes(forID idPodcast: Int) throws -> [Episodio] {
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
