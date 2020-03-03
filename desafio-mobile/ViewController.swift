//
//  ViewController.swift
//  desafio-mobile
//
//  Created by Frederico Saar Almeida Horta Barbosa on 29/02/20.
//  Copyright © 2020 Frederico Saar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func categoriasButtonPressed(_ sender: AnyObject) {
        
        self.performSegue(withIdentifier: "CategoriasSegue", sender:self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }


}

