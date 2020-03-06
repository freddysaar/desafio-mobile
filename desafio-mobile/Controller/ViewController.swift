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
      
        
        //API Request
        
        let json: [String: Any] = ["Query": "", "Offset": 0, "Size": 10]
        
        let requestBody = try? JSONSerialization.data(withJSONObject: json)

        let url = URL(string: "https://desafio.mobfiq.com.br/Search/Criteria")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = requestBody
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            
            
            //print(jsonData!["Products"]!)

            //decode
            let produto = try? JSONDecoder().decode(Produto.self, from: data)

            let i = 8
            
            print("Nome: \(produto!.products[i].name)")
            print("Preco de Tabela: \(produto!.products[i].skus[0].sellers[0].listPrice)")
            print("Preco: \(produto!.products[i].skus[0].sellers[0].price)")
            print("Melhor Opcao de Parcelamento: \(produto!.products[i].skus[0].sellers[0].bestInstallment!.count)")
            
            var desconto = 100 * ((produto!.products[i].skus[0].sellers[0].listPrice - produto!.products[i].skus[0].sellers[0].price) / produto!.products[i].skus[0].sellers[0].listPrice)
            
            desconto.round()
            print("Desconto: \(desconto)% OFF")
            
        }
        task.resume()
        
    }

}

