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

    // MARK: - UI Elements
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nome: UILabel!
    
    // MARK: - Life
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: - Actions
    // Funcao para setar o nome de um contato na celula e sua foto
    func bind(contato: ContatoView) {
        
        self.nome.text = contato.nome
        
        self.avatar.kf.setImage(with: contato.avatarUrl)
    }
}
