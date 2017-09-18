//
//  RepositoriesTableViewController.swift
//  desafio-mobile-ios
//
//  Created by Jean Carlos on 9/14/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import UIKit
import ICSPullToRefresh
import PKHUD

class RepositoriesTableViewController: UITableViewController {
    
    //MARK: Variáveis de controle
    var repositories = [Repositorie]()
    var page:Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Github Java"
        
        // Configurar Pull To Refresh e o Infinite Scrolling
        addPullToRefresh()
        addInfiniteScrolling()
        configureTableView()
        loadRepositories(true)
    }
    
    func addPullToRefresh() {
        tableView.addPullToRefreshHandler {
            self.page = 1
            
            self.repositories.removeAll()
            self.loadRepositories(false)
        }
    }
    
    func addInfiniteScrolling() {
        tableView.addInfiniteScrollingWithHandler {
            self.page += 1
            self.loadRepositories(false)
        }
    }
    
    func configureTableView(){
        tableView.register(UINib(nibName: "RepositoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "RepositoriesCell")
    }
    
    func loadRepositories(_ showProgress : Bool) {
        // Mostrar PKHUD
        if showProgress {
            HUD.show(.progress)
        }
        
        API.getRepositoriesAPI(page) { response in
            // Esconder PKHUD
            if showProgress {
                HUD.hide(animated: true)
            }
            
            self.repositories = response
            
            if self.repositories.count > 0 {
                // Retornou alguma coisa
                self.tableView.reloadData()
            } else {
                // Array vazio
                let alertArrayEmpty: UIAlertController = UIAlertController(title: "Repositório Vazio", message: "Não foi encontrado nenhum repositório.", preferredStyle: UIAlertControllerStyle.alert)
                let actionOk: UIAlertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: { (acao) in
                
                })
                let actionCancel: UIAlertAction = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.cancel, handler: { (acao) in
                    
                })
                
                alertArrayEmpty.addAction(actionOk)
                alertArrayEmpty.addAction(actionCancel)
                
                self.present(alertArrayEmpty, animated: true) { () -> Void in
                    
                    print("Foi")
                    
                }
            }
        }
    }

    ///MARK: Métodos de UITableViewDataSource e UITableViewDelegate

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RepositoiresTableViewCell = tableView.dequeueReusableCell(withIdentifier: "RepositoriesCell", for: indexPath) as! RepositoiresTableViewCell
        let repositorie = repositories[indexPath.row] as Repositorie
        
        cell.initWithRepositorie(repositorie)
        
        self.tableView.pullToRefreshView?.stopAnimating()
        self.tableView.infiniteScrollingView?.stopAnimating()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repositorie = repositories[indexPath.row] as Repositorie
        let owner = repositorie.owner
        let login = owner?.login
        let repositorieName = repositorie.nameRepositories
        
        let pull = PullRequestTableViewController()
        pull.login = login
        pull.repositorieName = repositorieName
        self.navigationController?.pushViewController(pull, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}
