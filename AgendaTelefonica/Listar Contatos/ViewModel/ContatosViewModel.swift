//
//  ContatosViewModel.swift
//  AgendaTelefonica
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import Foundation
import RealmSwift

// Struct que contem todas as informacoes do usuario
struct ContatoView {

    var id: Int = 0
    var nome: String = ""
    var email: String = ""
    var telefone: String = ""
    var avatar: String = ""
    
    var avatarUrl: URL? {
        
        return URL(string: self.avatar)
    }
}

class ContatosViewModel {
    
    // Funcao criada para retornar apenas uma pessoa
    static func getAsView(_ contato: Contato?) -> ContatoView {
        
        guard let contato = contato else {
            
            return ContatoView()
        }
        
        var contatoView = ContatoView()
        
        contatoView.telefone = contato.telefone ?? ""
        contatoView.id = contato.id.value ?? 0
        contatoView.nome = contato.nome ?? ""
        contatoView.email = contato.email ?? ""
        contatoView.avatar = contato.avatar ?? ""
        
        return contatoView
    }
    
    // Funcao criada para retornar um vetor de pessoas
    static func getAsView(sequence contatos: [Contato]) -> [ContatoView] {
        
        var contatosView = [ContatoView]()
        
        for contato in contatos {
            
            contatosView.append(self.getAsView(contato))
        }
        
        return contatosView
    }
    
        // MARK: - Realm
    static func save(contatos: [Contato]) {
        
        try! uiRealm.write {
            uiRealm.add(contatos, update: true)
            
        }
    }
    
    static func clear() {
        
        try! uiRealm.write {
            uiRealm.delete(uiRealm.objects(Contato.self))
        }
    }
    
    // Funcao criada para pegar todos os contatos do banco com as informacoes de cada um
    static func get() -> [ContatoView] {
        
        let contatosModel = uiRealm.objects(Contato.self)
        
        var contatos: [Contato] = []
        contatos.append(contentsOf: contatosModel)

        return self.getAsView(sequence: contatos)
    }
    
    // Funcao criada para pegar o ID de um certo contato no banco e retornar suas informacoes
    static func get(id: Int) -> ContatoView {
        
        let contatosModel = uiRealm.object(ofType: Contato.self, forPrimaryKey: id)
        
        return getAsView(contatosModel)
    }
}
