//
//  DetalheContatoViewController.swift
//  AgendaTelefonica
//
//  Created by José Matela Neto on 31/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftMessages

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
        btnConfirmar.isEnabled = false
    
        self.btnConfirmar.setTitle(L10n.Contatos.ativaredicao, for: .normal)
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
        btnConfirmar.isEnabled = true
        btnConfirmar.setTitle(L10n.Contatos.confirmar, for: .normal)
    }
    
    // Funcao para editar um determinado contato, passando como parametro seu ID para editar no banco suas informacoes
    @IBAction func confirmarEdicao(_ sender: Any) {
        
        self.service.putEditarContato(id: id, edicaoNome: txtNome.text!, edicaoAniversario: 0, edicaoEmail: txtEmail.text!, edicaoTelefone: txtTelefone.text!, edicaoUrlImagem: txtUrl.text!)
        
        let view = MessageView.viewFromNib(layout: .cardView)
        
        // Theme message elements with the warning style.
        view.configureTheme(.warning)
        
        // Add a drop shadow.
        view.configureDropShadow()
        
        // Set message title, body, and icon. Here, we're overriding the default warning
//        view.configureContent(title: "Contato Editado", body: "O contato \(self.txtNome.text!) foi editado com sucesso", buttonImage: nil, buttonTitle: nil)
        view.configureContent(title: "Contato Editado", body: "O contato \(self.txtNome.text!) foi editado com sucesso", iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: nil, buttonTapHandler: { _ in SwiftMessages.hide() })
        // Show the message.
//        view.buttonTapHandler = {
//            _ in SwiftMessages.hide()
//        }
        SwiftMessages.show(view: view)
        
        self.navigationController?.popToRootViewController(animated: true)
        
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
