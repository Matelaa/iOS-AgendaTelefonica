//
//  ViewController.swift
//  AgendaTelefonica
//
//  Created by administrador on 17/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit
import SwiftMessages

class ViewController: UIViewController {
    
    // MARK: - Vars
    var service: AutenticacaoService!
    
    // MARK: - UI Elements
    @IBOutlet weak var imagemIcone: UIImageView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var btnEntrar: UIButton!
    @IBOutlet weak var btnCadastrar: UIButton!
    
    // MARK: - Life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.service = AutenticacaoService(delegate: self)
        
        self.imagemIcone.image = Asset.iconeTelefone.image
        
        self.txtEmail.text = "matela@gmail.com"
        self.txtSenha.text = ""
        
        self.txtEmail.placeholder = L10n.Login.email
        self.txtSenha.placeholder = L10n.Login.senha
        
        self.btnEntrar.setTitle(L10n.Login.entrar, for: .normal)
        self.btnEntrar.layer.cornerRadius = self.btnEntrar.bounds.height / 2
        self.btnEntrar.backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
        
        self.btnCadastrar.setTitle(L10n.Login.cadastrar, for: .normal)
        self.btnCadastrar.layer.cornerRadius = self.btnCadastrar.bounds.height / 2
        self.btnCadastrar.backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
    }
    
    //
    // MARK: - Actions
    // Funcao criada para entrar no aplicativo com o usuario criado no Postman
    @IBAction func entrar(_ sender: Any) {
        
        if let email = self.txtEmail.text, let senha = self.txtSenha.text {
            
            self.service.postLogin(email: email, senha: senha)
        }
    }
    @IBAction func cadastrar(_ sender: Any) {
    
        self.perform(segue: StoryboardSegue.Main.segueCadastro)
    }
}

// Caso o Login seja igual ao do Postman, ele ira continuar a aplicacao
extension ViewController: AutenticacaoServiceDelegate {
    func delLogoutSuccess() {
        
    }
    
    func delLogoutFailure(error: String) {

        print(error)
    }
    
    func postLoginSuccess() {
        
        self.perform(segue: StoryboardSegue.Main.segueEntrar)
    }
    
    func postLoginFailure(error: String) {
        
//        let alert = UIAlertController(title: "Dados errados", message: "Voce digitou algum dado errado, tente novamente", preferredStyle: UIAlertControllerStyle.alert)
//        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
//        self.present(alert, animated: true, completion: nil)
        
        let view = MessageView.viewFromNib(layout: .cardView)
        
        // Theme message elements with the warning style.
        view.configureTheme(.error)
        
        // Add a drop shadow.
        view.configureDropShadow()
        
        // Set message title, body, and icon. Here, we're overriding the default warning
        view.configureContent(title: "Dados errados", body: "Digite novamente seu e-mail ou senha")
        view.button?.isHidden = true
        var config = SwiftMessages.defaultConfig
        config.duration = .automatic
        // Show the message.
        SwiftMessages.show(config: config, view: view)
    }
}
