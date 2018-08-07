//
//  ViewController.swift
//  AgendaTelefonica
//
//  Created by administrador on 17/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Vars
    var service: LoginService!
    
    // MARK: - UI Elements
    @IBOutlet weak var imagemIcone: UIImageView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var btnEntrar: UIButton!
    @IBOutlet weak var btnCadastrar: UIButton!
    
    // MARK: - Life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.service = LoginService(delegate: self)
        
        self.imagemIcone.image = Asset.iconeTelefone.image
        
        self.txtEmail.text = "matela@gmail.com"
        self.txtSenha.text = "12345678"
        
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
        
    }
    
}

// Caso o Login seja igual ao do Postman, ele ira continuar a aplicacao
extension ViewController: LoginServiceDelegate {
    func postLoginSuccess() {
        
        self.perform(segue: StoryboardSegue.Main.segueEntrar)
    }
    
    func postLoginFailure(error: String) {
        print(error)
    }
}
