//
//  DetalheContatoViewController.swift
//  AgendaTelefonica
//
//  Created by José Matela Neto on 31/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit
import RealmSwift

class DetalheContatoViewController: UIViewController {
    
    // MARK: - UI Elements
    @IBOutlet weak var imagemContato: UIImageView!
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtTelefone: UITextField!
    @IBOutlet weak var txtUrl: UITextField!
    @IBOutlet weak var btnConfirmar: UIButton!
    
    // MARK: - Vars
    var id: Int = 0
    var contatos: ContatoView!
    var nomeEditado: String = ""
    var emailEditado: String = ""
    var telefoneEditado: String = ""
    var urlEditado: String = ""
    var service: ContatoService!
    
    // MARK: - Life
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.service = ContatoService(delegate: self)
        
        contatos = ContatosViewModel.get(id: id)
        self.title = "\(contatos.nome)"
        imagemContato.kf.setImage(with: contatos.avatarUrl)
        self.txtNome.text = contatos.nome
        self.txtEmail.text = contatos.email
        self.txtTelefone.text = contatos.telefone
        self.txtUrl.text = contatos.avatar
        
        txtNome.isEnabled = false
        txtEmail.isEnabled = false
        txtTelefone.isEnabled = false
        txtUrl.isEnabled = false
        
        self.btnConfirmar.setTitle(L10n.Contatos.confirmar, for: .normal)
        self.btnConfirmar.layer.cornerRadius = self.btnConfirmar.bounds.height / 2
        self.btnConfirmar.backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
        
        let btnEditar = UIBarButtonItem(title: L10n.Contatos.editar, style: .plain, target: self, action: #selector(DetalheContatoViewController.editar))
        self.navigationItem.rightBarButtonItem = btnEditar
    }
    
    // MARK: - Actions
    // Funcao para poder habilitar a edicao dos textfield's da tela
    @objc func editar() {
        
        txtNome.isEnabled = true
        txtEmail.isEnabled = true
        txtTelefone.isEnabled = true
        txtUrl.isEnabled = true
    }
    
    // Funcao para editar um determinado contato, passando como parametro seu ID para editar no banco suas informacoes
    @IBAction func confirmarEdicao(_ sender: Any) {
        
        self.service.putEditarContato(id: id, edicaoNome: txtNome.text!, edicaoAniversario: 0, edicaoEmail: txtEmail.text!, edicaoTelefone: txtTelefone.text!, edicaoUrlImagem: txtUrl.text!)
        
        let alert = UIAlertController(title: "Contato Editado", message: "O contato \(self.txtNome.text!) foi editado com sucesso", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}

extension DetalheContatoViewController: ContatoServiceDelegate {
    func criarContatoSuccess() {
        
    }
    
    func criarContatoFailure(error: String) {
        
    }
    
    func getContatosSuccess() {
        
    }
    
    func getContatosFailure(error: String) {
        
    }
    
}
