//
//  Categoria.swift
//  desafio-mobile
//
//  Created by Frederico Saar Almeida Horta Barbosa on 08/03/20.
//  Copyright © 2020 Frederico Saar. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let categoria = try? newJSONDecoder().decode(Categoria.self, from: jsonData)

import Foundation

// MARK: - Categoria
struct Categoria: Codable {
    let categories: [Category]
    let id: Int

    enum CodingKeys: String, CodingKey {
        case categories = "Categories"
        case id = "Id"
    }
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name: String
    let image: JSONNull?
    let redirect: Redirect
    let subCategories: [Category]?
    let highlight: Bool
    let icon: String?
    let categoryListOrder, categoryTreeOrder, linkID: Int

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case image = "Image"
        case redirect = "Redirect"
        case subCategories = "SubCategories"
        case highlight = "Highlight"
        case icon = "Icon"
        case categoryListOrder = "CategoryListOrder"
        case categoryTreeOrder = "CategoryTreeOrder"
        case linkID = "LinkId"
    }
}

// MARK: - Redirect
struct Redirect: Codable {
    let id: Int
    let searchCriteria: SearchCriteria
    let title: String
    let type: Int

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case searchCriteria = "SearchCriteria"
        case title = "Title"
        case type = "Type"
    }
}

// MARK: - SearchCriteria
struct SearchCriteria: Codable {
    let query: JSONNull?
    let orderBy: Int
    let size, offset: Int?
    let filter: JSONNull?
    let apiQuery: String
    let productID, hotsite, realProductID, ean: JSONNull?
    let realProductIDGroup, facetItems: JSONNull?
    let searchAPI: SearchAPI?

    enum CodingKeys: String, CodingKey {
        case query = "Query"
        case orderBy = "OrderBy"
        case size = "Size"
        case offset = "Offset"
        case filter = "Filter"
        case apiQuery = "ApiQuery"
        case productID = "ProductId"
        case hotsite = "Hotsite"
        case realProductID = "RealProductId"
        case ean = "EAN"
        case realProductIDGroup = "RealProductIdGroup"
        case facetItems = "FacetItems"
        case searchAPI = "SearchApi"
    }
}

enum SearchAPI: String, Codable {
    case base = "base"
}

