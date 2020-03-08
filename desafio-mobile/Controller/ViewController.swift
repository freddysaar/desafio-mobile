//
//  ViewController.swift
//  desafio-mobile
//
//  Created by Frederico Saar Almeida Horta Barbosa on 29/02/20.
//  Copyright © 2020 Frederico Saar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var productList: [Product] = []
    
    //Outlets
    @IBAction func categoriasButtonIsPressed(_ sender: Any) {
               self.performSegue(withIdentifier: "CategoriasSegue", sender:self)
    }
    
    @IBOutlet weak var vitrineCollectionView: UICollectionView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.vitrineCollectionView.delegate = self
        self.vitrineCollectionView.dataSource = self
        
        
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
            
//            let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            
            
            //print(jsonData!["Products"]!)

            //decode
            let produto = try? JSONDecoder().decode(Produto.self, from: data)

            self.productList = produto?.products ?? []
            
            
            //refazer collection view depois da requisicao completa
            DispatchQueue.main.async {
                self.vitrineCollectionView.reloadData()
            }

            
        }
        task.resume()
        
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let produtoNome = productList[indexPath.item].skus[0].name
        let preco = productList[indexPath.item].skus[0].sellers[0].price
        let precoDeTabela = productList[indexPath.item].skus[0].sellers[0].listPrice
        
        let parcelas = productList[indexPath.item].skus[0].sellers[0].bestInstallment?.count
        let parcelasValor = productList[indexPath.item].skus[0].sellers[0].bestInstallment?.value
        var melhorParcelamento = ""
        
        if((parcelas != nil) && (parcelasValor != nil)){
            melhorParcelamento = String(format: "\(parcelas!)x de R$$%,02f", parcelasValor!)
        }
        
        if(preco != precoDeTabela) {
            let desconto = 100 * ((precoDeTabela - preco) / precoDeTabela)
            cell.produtoDesconto.text = String("\(Int(desconto.rounded()))% OFF")
            cell.produtoPrecoFinal.text = String(format: "R$$%,02f", preco)
            cell.produtoPrecoTabela.text = String(format: "R$$%,02f", precoDeTabela)
        } else {
            cell.produtoParcelamento.isHidden = true
            cell.produtoPrecoTabela.isHidden = true
            cell.produtoDesconto.isHidden = true
        }
        if(melhorParcelamento == "") {
            cell.produtoParcelamento.isHidden = true
        }

        
        cell.produtoNome.text = produtoNome
        cell.produtoPrecoFinal.text = String(format: "R$ $%.02f", preco)
        cell.produtoParcelamento.text = melhorParcelamento
        
        

        return cell
    }
    
    
    
    
}

