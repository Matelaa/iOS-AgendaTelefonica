//
//  CadastroViewController.swift
//  AgendaTelefonica
//
//  Created by José Matela Neto on 13/08/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit
import SwiftMessages

class CadastroViewController: UIViewController {
    
    var service: AutenticacaoService!
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var txtConfrmarSenha: UITextField!
    @IBOutlet weak var btnCadastrar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.service = AutenticacaoService(delegate: self)
        
        txtEmail.placeholder = L10n.Login.Cadastrar.email
        txtSenha.placeholder = L10n.Login.Cadastrar.senha
        txtConfrmarSenha.placeholder = L10n.Login.Cadastrar.confirmarsenha
        
        self.btnCadastrar.setTitle(L10n.Login.cadastrar, for: .normal)
        self.btnCadastrar.layer.cornerRadius = self.btnCadastrar.bounds.height / 2
        self.btnCadastrar.backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
        
    }
    @IBAction func cadastrar(_ sender: UIButton) {
        
        if let emailSalvar = self.txtEmail.text, let senhaSalvar = self.txtSenha.text, let confirmarSenhaSalvar = self.txtConfrmarSenha.text {
            
            self.service.postUser(emailC: emailSalvar, senhaC: senhaSalvar, confirmarSenhaC: confirmarSenhaSalvar)
            
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.success)
            view.configureDropShadow()
            view.configureContent(title: "Usuario criado com sucesso", body: "Seu novo usuario foi criado, entre na sua conta para usar o aplicativo")
            view.button?.isHidden = true
            view.buttonTapHandler = {
                _ in SwiftMessages.hide()
            }
            SwiftMessages.show(view: view)
        }
    }
}

extension CadastroViewController: AutenticacaoServiceDelegate {
    
    func postUserSuccess() {
        
        self.dismiss(animated: true)
    }
    
    func postUserFailure(error: String) {
        
        print(error)
    }
}
