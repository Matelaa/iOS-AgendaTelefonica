//
//  ContatosViewController.swift
//  AgendaTelefonica
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit

class ContatosViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var service: ContatoService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = L10n.Contatos.title
        self.service = ContatoService(delegate: self)
    }
}

extension ContatosViewController: ContatoServiceDelegate {
    
    func getContatosSuccess() {
        
    }
    
    func getContatosFailure(error: String) {
        
    }
}
