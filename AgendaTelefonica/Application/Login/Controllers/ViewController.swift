//
//  ViewController.swift
//  AgendaTelefonica
//
//  Created by administrador on 17/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Elements
    @IBOutlet weak var imagemIcone: UIImageView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var btnEntrar: UIButton!
    @IBOutlet weak var btnCadastrar: UIButton!
    
    // MARK: - Life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagemIcone.image = Asset.iconeTelefone.image
        
        self.txtEmail.placeholder = L10n.Login.email
        self.txtSenha.placeholder = L10n.Login.senha
        
        self.btnEntrar.setTitle(L10n.Login.entrar, for: .normal)
        self.btnEntrar.layer.cornerRadius = self.btnEntrar.bounds.height / 2
        self.btnEntrar.backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
        
        self.btnCadastrar.setTitle(L10n.Login.cadastrar, for: .normal)
        self.btnCadastrar.layer.cornerRadius = self.btnCadastrar.bounds.height / 2
        self.btnCadastrar.backgroundColor = UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1)
        
    }
    
    @IBAction func entrar(_ sender: Any) {
    
    }
    
    @IBAction func cadastrar(_ sender: Any) {
    
    }
    
}

