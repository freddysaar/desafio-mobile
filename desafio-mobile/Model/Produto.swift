//
//  Message.swift
//  desafio-mobile
//
//  Created by Frederico Saar Almeida Horta Barbosa on 05/03/20.
//  Copyright © 2020 Frederico Saar. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let produto = try? newJSONDecoder().decode(Produto.self, from: jsonData)

import Foundation

// MARK: - Produto
struct Produto: Codable {
   let size, offset, total: Int
   let delay: Double
   let products: [Product]
   let apiQuery: String

   enum CodingKeys: String, CodingKey {
       case size = "Size"
       case offset = "Offset"
       case total = "Total"
       case delay = "Delay"
       case products = "Products"
       case apiQuery = "ApiQuery"
   }
}

// MARK: - Product
struct Product: Codable {
   let availability: Bool
   let skus: [Skus]
   let name, id, brand, productDescription: String
   let category: String
   let categories: [String]
   let specifications: [String: [String]]
   let variations: [Variation]
   let videos: [String]?
   let images: JSONNull?
   let realID: String

   enum CodingKeys: String, CodingKey {
       case availability = "Availability"
       case skus = "Skus"
       case name = "Name"
       case id = "Id"
       case brand = "Brand"
       case productDescription = "Description"
       case category = "Category"
       case categories = "Categories"
       case specifications = "Specifications"
       case variations = "Variations"
       case videos = "Videos"
       case images = "Images"
       case realID = "RealId"
   }
}

// MARK: - Skus
struct Skus: Codable {
   let id, name: String
   let order: JSONNull?
   let sellers: [Seller]
   let images: [Image]
   let variations: Variations
   let skuName: String
   let unitMultiplier: Int
   let complementName: String
   let measurementUnit: MeasurementUnit
   let referenceID: [ReferenceID]
   let ean: String

   enum CodingKeys: String, CodingKey {
       case id = "Id"
       case name = "Name"
       case order = "Order"
       case sellers = "Sellers"
       case images = "Images"
       case variations = "Variations"
       case skuName = "SkuName"
       case unitMultiplier = "UnitMultiplier"
       case complementName = "ComplementName"
       case measurementUnit = "MeasurementUnit"
       case referenceID = "ReferenceId"
       case ean = "EAN"
   }
}

// MARK: - Image
struct Image: Codable {
   let imageURL: String
   let imageTag: String
   let label: Label?

   enum CodingKeys: String, CodingKey {
       case imageURL = "ImageUrl"
       case imageTag = "ImageTag"
       case label = "Label"
   }
}

enum Label: String, Codable {
   case empty = ""
   case horizontal = "horizontal"
}

enum MeasurementUnit: String, Codable {
   case un = "un"
}

// MARK: - ReferenceID
struct ReferenceID: Codable {
   let key: Key
   let value: String

   enum CodingKeys: String, CodingKey {
       case key = "Key"
       case value = "Value"
   }
}

enum Key: String, Codable {
   case refID = "RefId"
}

// MARK: - Seller
struct Seller: Codable {
   let id: String
   let name: Name
   let quantity: Int
   let price, listPrice: Double
   let bestInstallment: BestInstallment?
   let offer: JSONNull?

   enum CodingKeys: String, CodingKey {
       case id = "Id"
       case name = "Name"
       case quantity = "Quantity"
       case price = "Price"
       case listPrice = "ListPrice"
       case bestInstallment = "BestInstallment"
       case offer = "Offer"
   }
}

// MARK: - BestInstallment
struct BestInstallment: Codable {
   let count: Int
   let value, total: Double
   let rate: Int

   enum CodingKeys: String, CodingKey {
       case count = "Count"
       case value = "Value"
       case total = "Total"
       case rate = "Rate"
   }
}

enum Name: String, Codable {
   case philips = "Philips"
   case polishop = "polishop"
}

// MARK: - Variations
struct Variations: Codable {
   let voltagem: [String]
   let cor: [Cor]?

   enum CodingKeys: String, CodingKey {
       case voltagem = "Voltagem"
       case cor = "Cor"
   }
}

enum Cor: String, Codable {
   case nd = "ND"
}

enum Variation: String, Codable {
   case cor = "Cor"
   case voltagem = "Voltagem"
}


