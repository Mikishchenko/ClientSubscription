//
//  CSTableHeaderView.swift
//  testClientSubscription
//
//  Created by Владимир Микищенко on 06/08/2019.
//  Copyright © 2019 Владимир Микищенко. All rights reserved.
//

import UIKit

class CSTableHeaderView: UIView {
    private let subscriptionTitleText = "Подключенные услуги"
    private lazy var label: UILabel = {
        let l = UILabel()
        l.textColor = .white
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        l.numberOfLines = 0
        l.contentMode = .left
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        Helper.add3SidesFenced(label, over: self)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ section: Sections) {
        switch section {
        case .Subscriptions: label.text = subscriptionTitleText
        case .Button: break
        }
    }
}
