//
//  ViewController.swift
//  AgendaTelefonica
//
//  Created by administrador on 17/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imagemIcone: UIImageView!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var btnEntrar: UIButton!
    @IBOutlet weak var btnCadastrar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.btnEntrar.setTitle("Entrar", for: .normal)
        self.btnCadastrar.setTitle("Cadastrar", for: .normal)
    }
    
    @IBAction func entrar(_ sender: Any) {
    
    }
    
    @IBAction func cadastrar(_ sender: Any) {
    }
    
}

