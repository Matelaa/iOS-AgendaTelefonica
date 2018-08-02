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
    
    @IBOutlet weak var imagemContato: UIImageView!
    @IBOutlet weak var nomeContato: UILabel!
    @IBOutlet weak var emailContato: UILabel!
    @IBOutlet weak var telefoneContato: UILabel!
    @IBOutlet weak var urlImagemContato: UILabel!
    var nome : String!
    // fazer uma contatoview para pegar as informacoes do id
    
    var id: Int = 0
    
    var contatos: ContatoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        contatos = ContatosViewModel.get(id: id)
        
        imagemContato.kf.setImage(with: contatos.avatarUrl)
        nomeContato.text = contatos.nome
        emailContato.text = contatos.email
        urlImagemContato.text = contatos.avatar
        
        self.title = "\(contatos.nome)"
        
    }
}
