//
//  ViewController.swift
//  HistoryView
//
//  Created by Decagon on 18/08/2021.
//

import UIKit

class HistoryViewController: UITableViewController {
    
    var viewModel: HistoryViewModel?
//    var sections = [HistorySection]()
    
    let cellId = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
//        data()
        fetchTransactions()
    }
    
    func fetchTransactions() {
        HistoryService.shared.fetchTransaction { [weak self] (result) in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let transactions):
                self.viewModel?.transactions = transactions
                self.tableView.reloadData()
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func style() {
        navigationItem.title = "Movies"
        tableView.register(HistoryViewCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        
        viewModel = HistoryViewModel()
    }
    
//    func data() {
//        let tx1 = Transaction(id: 1, type: "redeemable", amount: "140", processingDate: Date())
//        let tx2 = Transaction(id: 1, type: "redeemable", amount: "353", processingDate: Date())
//        let tx3 = Transaction(id: 1, type: "redeemable", amount: "75", processingDate: Date())
//        let tx4 = Transaction(id: 1, type: "redeemable", amount: "785", processingDate: Date())
//        let tx5 = Transaction(id: 1, type: "redeemable", amount: "245", processingDate: Date())
//        let tx6 = Transaction(id: 1, type: "redeemable", amount: "865", processingDate: Date())
//
//        let firstSection = HistorySection(title: "July", transactions: [tx1])
//        let secondSection = HistorySection(title: "August", transactions: [tx2, tx3])
//        let thirdSection = HistorySection(title: "December", transactions: [tx4, tx5, tx6])
//
//        sections.append(firstSection)
//        sections.append(secondSection)
//        sections.append(thirdSection)
//    }
    
}

extension HistoryViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let vm = viewModel else { return 0 }
        
        switch section {
        case 0:
            return vm.sections[0].transactions.count
        case 1:
            return vm.sections[1].transactions.count
        case 2:
            return vm.sections[2].transactions.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let vm = viewModel else { return UITableViewCell() }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? HistoryViewCell else {
            return UITableViewCell()
        }
        
        let section = indexPath.section
        
        var transaction: Transaction
        switch section {
        case 0:
            transaction = vm.sections[0].transactions[indexPath.row]
        case 1:
            transaction = vm.sections[1].transactions[indexPath.row]
        case 2:
            transaction = vm.sections[2].transactions[indexPath.row]
        default:
            return UITableViewCell()
        }
        cell.transaction = transaction
        //        cell.textLabel?.text = transaction.amount
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        guard let vm = viewModel else { return nil }
        
        switch section {
        case 0:
            return vm.sections[0].title
        case 1:
            return vm.sections[1].title
        case 2:
            return vm.sections[2].title
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let vm = viewModel else { return 0 }
        return vm.sections.count
    }
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .tileBrown
    }
}

