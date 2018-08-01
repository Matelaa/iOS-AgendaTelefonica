//
//  ContatosViewController.swift
//  AgendaTelefonica
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit
import Kingfisher

class ContatosViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var service: ContatoService!
    
    var contatos: [ContatoView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.title = L10n.Contatos.title
        self.service = ContatoService(delegate: self)
        self.service.getContatos()
        self.tableView.register(cellType: ContatoTableViewCell.self)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        
    }
}

extension ContatosViewController: ContatoServiceDelegate {
    func criarContatoSuccess() {
        
    }
    
    func criarContatoFailure(error: String) {
        
    }
    
    
    func getContatosSuccess() {
        
        self.contatos = ContatosViewModel.get()
        self.tableView.reloadData()
        
        for contato in ContatosViewModel.get() {
            print(contato.nome)
        }
    }
    
    func getContatosFailure(error: String) {
        
    }
    
}

extension ContatosViewController: UITableViewDataSource, UITableViewDelegate {
    
    // funcao para setar o numero de celular de acordo com o numero de contatos cadastrados
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.contatos.count
    }
    
    // funcao para setar o tamanho de uma celula
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 91
    }
    
    // funcao para setar cada celula de uma tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath) as ContatoTableViewCell
        
        cell.bind(contato: self.contatos[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "segueDetalhe", sender: self)

    }
}
