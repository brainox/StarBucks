//
//  TransactionsModel.swift
//  HistoryView
//
//  Created by Decagon on 18/08/2021.
//

import Foundation

struct HistorySection: Codable {
    let title: String
    let transactions: [Transaction]
}

struct History: Codable {
    let transactions: [Transaction]
}

struct Transaction: Codable {
    let id: Int
    let type: String
    let amount: String
    let processingDate: Date
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case amount
        case processingDate = "processed_at"
    }
}
