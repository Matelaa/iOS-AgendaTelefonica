//
//  ContatoService.swift
//  AgendaTelefonica
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

// protocol gera funcoes que devem ser implementadas obrigatoriamente
protocol ContatoServiceDelegate {
    
    func getContatosSuccess()
    func getContatosFailure(error: String)
    func criarContatoSuccess()
    func criarContatoFailure(error: String)
}

class ContatoService {
    
    
    var delegate: ContatoServiceDelegate
    
    required init(delegate: ContatoServiceDelegate) {
        self.delegate = delegate
    }
    
    // Funcao para sempre atualizar e salvar no banco quando é requisitado para adicionar um contato ou atualizar a lista
    func getContatos() {
        
        ContatoRequestFactory.getContatos().validate().responseArray { (response: DataResponse<[Contato]>) in
            
            switch response.result {
                
            case .success:
                
                if let contatos = response.result.value {
                    
                    ContatosViewModel.clear()
                    
                    ContatosViewModel.save(contatos: contatos)
                }
                
                self.delegate.getContatosSuccess()
                
            case .failure(let error):
                
                self.delegate.getContatosFailure(error: error.localizedDescription)
            }
        }
    }
    
    // Funcao criada para inserir um contato no banco de dados através da aplicacao
    func postContatos(nomeContato: String, aniversarioContato: Int, emailContato: String, telefoneContato: String, urlImagemContato: String) {
        
        ContatoRequestFactory.postCriar(nome: nomeContato, aniversario: aniversarioContato, email: emailContato, telefone: telefoneContato, avatar: urlImagemContato).validate().responseObject { (response: DataResponse<Contato>) in
            
            switch response.result {
                
            case .success:
                
                if let contatos = response.result.value {
                    
                    ContatosViewModel.clear()
                    
                    ContatosViewModel.save(contatos: [contatos])
                }
                
                self.delegate.getContatosSuccess()
                
            case .failure(let error):
                
                self.delegate.getContatosFailure(error: error.localizedDescription)
            }
        }
    }
    
    // Funcao criada para editar as informacoes do contato pegando como parametro principal o seu ID e editar todas as informacoes
    func putEditarContato(id: Int, edicaoNome: String, edicaoAniversario: Int, edicaoEmail: String, edicaoTelefone: String, edicaoUrlImagem: String) {

        ContatoRequestFactory.putEditar(contatoId: id, nome: edicaoNome, aniversario: edicaoAniversario, email: edicaoEmail, telefone: edicaoTelefone, avatar: edicaoUrlImagem).validate().responseObject { (response: DataResponse<Contato>) in

            switch response.result {

            case .success:

                if let contatos = response.result.value {

                    ContatosViewModel.save(contatos: [contatos])
                }
                
                self.delegate.getContatosSuccess()
                
            case .failure(let error):
                
                self.delegate.getContatosFailure(error: error.localizedDescription)
            }
        }
    }
    
    func delContato(id: Int) {
        
        ContatoRequestFactory.del(contatoId: id).validate().responseObject { (response: DataResponse<Contato>) in
            
            switch response.result {
                
            case .success:
                
                if let contatos = response.result.value {
                    
                    ContatosViewModel.clear()
                }
                
                self.delegate.getContatosSuccess()
                
            case .failure(let error):
                
                self.delegate.getContatosFailure(error: error.localizedDescription)
            }
        }
    }
}


