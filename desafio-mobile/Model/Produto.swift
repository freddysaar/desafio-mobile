//
//  Message.swift
//  desafio-mobile
//
//  Created by Frederico Saar Almeida Horta Barbosa on 05/03/20.
//  Copyright © 2020 Frederico Saar. All rights reserved.
//

import Foundation

struct Produto: Codable {
    var id:Int?
    var message:String
    
    init(message:String){
        self.message = message
    }
}
