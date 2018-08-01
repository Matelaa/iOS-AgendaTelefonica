//
//  AdicionarContatoViewController.swift
//  AgendaTelefonica
//
//  Created by administrador on 20/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit
import RealmSwift

class AdicionarContatoViewController: UIViewController {

    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var urlImagem: UITextField!
    @IBOutlet weak var criar: UIButton!
    var contatos: [ContatoView] = []
    
    var service: ContatoService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = L10n.Contatos.novocontato
        
        self.service = ContatoService(delegate: self)

        
        self.nome.placeholder = L10n.Contatos.nome
        self.email.placeholder = L10n.Contatos.email
        self.telefone.placeholder = L10n.Contatos.telefone
        self.urlImagem.placeholder = L10n.Contatos.urlimagem
        
        self.criar.setTitle(L10n.Contatos.criar, for: .normal)
        self.criar.layer.cornerRadius = self.criar.bounds.height / 2
        self.criar.backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
        
    }
    @IBAction func criarContato(_ sender: Any) {
        
        if let nomeSalvar = self.nome.text, let emailSalvar = self.email.text, let telefoneSalvar = self.telefone.text, let urlSalvar = self.urlImagem.text {
        
            self.service.postContatos(nomeContato: nomeSalvar, aniversarioContato: 0, emailContato: emailSalvar, telefoneContato: telefoneSalvar, urlImagemContato: urlSalvar)
            
            self.navigationController
        }
    }
}

extension AdicionarContatoViewController: ContatoServiceDelegate {
    func getContatosFailure(error: String) {
        
    }
    
    func criarContatoSuccess() {
        
    }
    
    func criarContatoFailure(error: String) {
        
    }
    
    func getContatosSuccess() {
        
    }
}
    
    func getContatosFailure(error: String) {

}

