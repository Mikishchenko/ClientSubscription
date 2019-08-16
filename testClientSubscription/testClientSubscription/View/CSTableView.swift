//
//  CSTableView.swift
//  testClientSubscription
//
//  Created by Владимир Микищенко on 09/08/2019.
//  Copyright © 2019 Владимир Микищенко. All rights reserved.
//

import UIKit

enum Sections: Int, CaseIterable {
    case Subscriptions = 0, Button
}

class CSTableView: UITableView {
    var items: [ClientSubscription]?
    private var minVisibleItemsCount: Int = 2
    private var isShowAllItems: Bool = false
    private var sections: [Sections]!
    private let height: CGFloat = 44
    private let cellReuseID = String(describing: SubscriptionCell.self)
    private let oneButtonCellreuseID = String(describing: OneButtonCell.self)
    
    init(with items: [ClientSubscription]) {
        super.init(frame: CGRect.zero, style: .plain)
        self.items = items
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setup() {
        setSections()
        register(SubscriptionCell.self, forCellReuseIdentifier: cellReuseID)
        register(OneButtonCell.self, forCellReuseIdentifier: oneButtonCellreuseID)
        dataSource = self
        delegate = self
        separatorStyle = .none
        allowsSelection = false
        backgroundColor = .black
    }
    
    fileprivate func setSections() {
        sections = []
        Sections.allCases.forEach {
            switch $0 {
            case .Subscriptions: sections.append($0)
            case .Button:
                guard let itemsCount = items?.count,
                    itemsCount > minVisibleItemsCount else { break }
                sections.append($0)
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension CSTableView: UITableViewDataSource {
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .Subscriptions:
            // в результате поиска может оставаться одна услуга, отсюда min()
            return isShowAllItems ? items?.count ?? 0 : min(minVisibleItemsCount, items?.count ?? 0)
        case .Button: return 1
        }
        
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let defaultCell = UITableViewCell()
        switch sections[indexPath.section] {
        case .Subscriptions:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID) as? SubscriptionCell
                else { return defaultCell }
            guard let subscription = items?[indexPath.item] else { return defaultCell }
            cell.setup(subscription)
            return cell
        case .Button:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: oneButtonCellreuseID) as? OneButtonCell,
            var countItems = items?.count else { return defaultCell }
            countItems -= minVisibleItemsCount
            cell.setup(isShowAllItems, countItems) {
                self.isShowAllItems.toggle()
                self.reloadData()
            }
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension CSTableView: UITableViewDelegate {
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = CSTableHeaderView()
        header.setup(sections[section])
        return header
    }
    
    internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch sections[section] {
        case .Subscriptions: return height
        case .Button: return height / 4
        }
    }
    
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return estimatedRowHeight
    }
    
    // может быть лишняя анимация
    internal func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch sections[indexPath.section] {
        case .Subscriptions:
            cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            UIView.animate(withDuration: 0.5) {
                cell.transform = CGAffineTransform.identity
            }
        case .Button: break
        }
    }
}
