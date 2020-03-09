//
//  CategoriasViewController.swift
//  desafio-mobile
//
//  Created by Frederico Saar Almeida Horta Barbosa on 08/03/20.
//  Copyright © 2020 Frederico Saar. All rights reserved.
//

import UIKit

class CategoriasViewController: UIViewController {

    var categoryList: [Category] = []
    
    //Outlets
    @IBOutlet weak var categoriasTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self .categoriasTableView.delegate = self
        self.categoriasTableView.dataSource = self
        let url = URL(string: "https://desafio.mobfiq.com.br/StorePreference/CategoryTree")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            //decode
            let categoria = try? JSONDecoder().decode(Categoria.self, from: data)

            self.categoryList = categoria?.categories ?? []
            
            self.categoryList.sort { (lhs:Category, rhs:Category) in
                return lhs.name < rhs.name
            }
            
            DispatchQueue.main.async {
                self.categoriasTableView.reloadData()
            }
        }
        task.resume()
    }
}

extension CategoriasViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriaCell", for: indexPath) as? CategoriaViewCell else {
                return UITableViewCell()
            }
        
        
        let categoriaNome = categoryList[indexPath.item].name
        cell.textLabel?.text = categoriaNome

            return cell
        }
    

    }

