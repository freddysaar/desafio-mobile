//
//  APIRequestManager.swift
//  desafio-mobile
//
//  Created by Frederico Saar Almeida Horta Barbosa on 08/03/20.
//  Copyright © 2020 Frederico Saar. All rights reserved.
//

import Foundation

class JSONNull: Codable, Hashable {

   public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
       return true
   }

   public var hashValue: Int {
       return 0
   }

   public init() {}

   public required init(from decoder: Decoder) throws {
       let container = try decoder.singleValueContainer()
       if !container.decodeNil() {
           throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
       }
   }

   public func encode(to encoder: Encoder) throws {
       var container = encoder.singleValueContainer()
       try container.encodeNil()
   }
}

func postRequestProduto(request:URL){
    let json: [String: Any] = ["Query": "", "Offset": 0, "Size": 10]
    
    let requestBody = try? JSONSerialization.data(withJSONObject: json)

    let url = URL(string: "https://desafio.mobfiq.com.br/Search/Criteria")!
    var request = URLRequest(url: url)
    
    request.httpMethod = "POST"
    request.httpBody = requestBody
    
}

