//
//  PullRequestTableViewController.swift
//  desafio-mobile-ios
//
//  Created by Jean Carlos on 9/13/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import UIKit
import PKHUD
import SafariServices

class PullRequestTableViewController: UITableViewController {
    
    //MARK: Variáveis de controle
    var pullRequests = [PullRequests]()
    var login: String? = ""
    var repositorieName: String? = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configurando Pull to refresh
        addPullToRefresh()
        
        configureTableView()
        loadData(true)
        navigationItem.title = repositorieName
    }
    
    func addPullToRefresh(){
        tableView.addPullToRefreshHandler {
            self.pullRequests.removeAll()
            self.loadData(false)
        }
    }
    
    func configureTableView(){
        tableView.register(UINib(nibName: "PullRequestsTableViewCell", bundle: nil), forCellReuseIdentifier: "PullRequestCell")
    }
    
    func loadData(_ showProgress: Bool){
        // Chamar a API e popular os dados que vao alimentar a tableView
        if showProgress{
            HUD.show(.progress)
        }
        
        API.getPullRequests(login!, pullRequestRepository: repositorieName!) { response in
            if showProgress{
                HUD.flash(.success, delay: 1.0)
            }
            
            self.pullRequests = response
            
            if self.pullRequests.count > 0 {
                self.tableView.reloadData()
            }else{
                //ArrayVazio
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

    func openPullRequest(_ urlPullRequest: String) {
        if let url = URL(string: urlPullRequest) {
            let safariViewController = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            present(safariViewController, animated: true)
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pullRequests.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PullRequestsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PullRequestCell", for: indexPath) as! PullRequestsTableViewCell
        let pullRequest = pullRequests[indexPath.row] as PullRequests
        
        cell.initWithPullRequest(pullRequest)
        
        self.tableView.pullToRefreshView?.stopAnimating()
        self.tableView.infiniteScrollingView?.stopAnimating()

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pullRequest = pullRequests[indexPath.row] as PullRequests
        let url = pullRequest.url
        
        openPullRequest(url!)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }

}
