//
//  CSController.swift
//  testClientSubscription
//
//  Created by Владимир Микищенко on 30/07/2019.
//  Copyright © 2019 Владимир Микищенко. All rights reserved.
//

import UIKit

class CSController: UIViewController {
    private var items: [ClientSubscription]?
    private var table: CSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let data = SampleData.load() else { return }
        items = data
        view.backgroundColor = .black
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .black
        
        let search = CSSearchBar()
        search.items = data
        stackView.addArrangedSubview(search)
        
        table = CSTableView(with: data)
        stackView.addArrangedSubview(table)
        Helper.addConstrainted(stackView, over: self.view)
    }
    
    @objc func searchTextDidChange(_ textField: UITextField) {
        guard let items = items, let table = table,
            let text = textField.text else { return }
        if text.isEmpty {
            table.items = items
        } else {
            // здесь фильтруем даные согласно поискового запроса
            let filteredItems = items.filter {
                $0.serviceName.uppercased().contains(text.uppercased()) ||
                    $0.description.uppercased().contains(text.uppercased()) }
            if !filteredItems.isEmpty {
                table.items = filteredItems
            }
        }
        UIView.animate(withDuration: 0.5, animations: {
            table.reloadSections(IndexSet(integer: 0), with: .fade)
            table.reloadSections(IndexSet(integer: 1), with: .automatic)
        })
    }
    
}
