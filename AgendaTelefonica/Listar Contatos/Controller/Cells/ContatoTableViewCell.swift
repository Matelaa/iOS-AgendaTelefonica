//
//  ContatoTableViewCell.swift
//  AgendaTelefonica
//
//  Created by administrador on 20/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit
import Reusable

class ContatoTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nome: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // funcao para setar o nome de um contato na celular e sua foto
    
    func bind(contato: ContatoView) {
        
        self.nome.text = contato.nome
        
        self.avatar.kf.setImage(with: contato.avatarUrl)
    }
}
