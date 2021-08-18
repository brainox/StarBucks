//
//  HistoryViewModel.swift
//  HistoryView
//
//  Created by Decagon on 18/08/2021.
//

import UIKit

struct HistoryViewModel {
    
    // Output the display
    var sections = [HistorySection]()
    
    // Input
    var transactions: [Transaction]? {
        didSet {
            guard let txs = transactions else { return }
            
            // filter by month - hard coded
            let firstMonth = "Jul"
            let secondMonth = "Jun"
            let thirdMonth = "May"
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            
            let firstMonthTransactions = txs.filter {
                let dateString = dateFormatter.string(from: $0.processingDate)
                return dateString.starts(with: firstMonth)
            }
            
            let secondMonthTransactions = txs.filter {
                let dateString = dateFormatter.string(from: $0.processingDate)
                return dateString.starts(with: secondMonth)
            }
            
            let thirdMonthTransactions = txs.filter {
                let dateString = dateFormatter.string(from: $0.processingDate)
                return dateString.starts(with: thirdMonth)
            }
            
            // create sections
            let firstMonthSection = HistorySection(title: "July", transactions: firstMonthTransactions)
            let secondMonthSection = HistorySection(title: "June", transactions: secondMonthTransactions)
            let thirdMonthSection = HistorySection(title: "July", transactions: thirdMonthTransactions)
            
            // collect for display
            sections = [HistorySection]()
            sections.append(firstMonthSection)
            sections.append(secondMonthSection)
            sections.append(thirdMonthSection)
            
        }
    }
    
}
