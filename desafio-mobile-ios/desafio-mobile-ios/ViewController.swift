//
//  ViewController.swift
//  desafio-mobile-ios
//
//  Created by Jean Carlos on 8/29/17.
//  Copyright © 2017 Jean Carlos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let teste = PullRequestTableViewController()
        self.present(teste, animated: true, completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

