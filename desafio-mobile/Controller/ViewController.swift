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
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)

        
        let url = URL(string: "https://desafio.mobfiq.com.br/Search/Criteria")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print(responseJSON)
            }
        }
        task.resume()
        
        
        
        
    }

}

