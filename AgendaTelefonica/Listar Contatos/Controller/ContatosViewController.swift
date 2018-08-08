//
//  ContatosViewController.swift
//  AgendaTelefonica
//
//  Created by administrador on 19/07/2018.
//  Copyright © 2018 administrador. All rights reserved.
//

import UIKit
import Kingfisher
import MGSwipeTableCell
class ContatosViewController: UIViewController {
    
    // MARK: - UI Elements
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Vars
    var service: ContatoService!
    var contatos: [ContatoView] = []
    
    // MARK: - Life
    // Quando essa tela é aberta uma vez, ela executa esses comandos, e quando volta para ela, não executa mais
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = L10n.Contatos.title
        self.service = ContatoService(delegate: self)
        self.service.getContatos()
        self.tableView.register(cellType: ContatoTableViewCell.self)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    // Funcao criada para atualizar a tela toda vida que ela for aberta
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.service.getContatos()
    }
    
    // funcao criada para passar para a tela de detalhe o id daquele certo contato
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch StoryboardSegue.Contatos(rawValue: segue.identifier!)! {
            
        case .segueDetalhe:
            
            if let controller = segue.destination as? DetalheContatoViewController {
                
                if let id = sender as? Int {
                    
                    controller.id = id
                }
            }
        case .segueAdicionar: break
            
        }
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
    
    //funcao para setar cada celula de uma tableview, juntamente com a funcao de Swipe to Delete, da bilioteca (MGSwipeTableCell)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(for: indexPath) as ContatoTableViewCell

        cell.rightButtons = [MGSwipeButton(title: "", icon: Asset.trash.image, backgroundColor: UIColor(red: 240/255, green: 77/255, blue: 77/255, alpha: 1), padding: 25){
            (sender: MGSwipeTableCell!) -> Bool in
            let deletado = self.contatos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            self.service.delContato(id: deletado.id)
            return true
        }]
        cell.rightSwipeSettings.transition = .rotate3D
        cell.bind(contato: self.contatos[indexPath.row])

        return cell
    }
    
    // funcao para eu pegar aquele determinado contato que esta localizada em um determinado index do array de celulas
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.perform(segue: StoryboardSegue.Contatos.segueDetalhe, sender: self.contatos[indexPath.row].id)
        
    }
}
