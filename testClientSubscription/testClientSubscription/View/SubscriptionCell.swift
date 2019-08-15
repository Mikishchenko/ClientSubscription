//
//  SubscriptionCell.swift
//  testClientSubscription
//
//  Created by Владимир Микищенко on 31/07/2019.
//  Copyright © 2019 Владимир Микищенко. All rights reserved.
//

import UIKit

class SubscriptionCell: UITableViewCell {
    private let margin: CGFloat = 10
    private lazy var backView: UIView = { [unowned self] in
        let v = UIView(frame: CGRect.zero)
        v.backgroundColor = .white
        v.layer.cornerRadius = margin
        v.clipsToBounds = true
        return v
        }()
    private lazy var serviceNameLabel: UILabel = { [unowned self] in
        let l = UILabel()
        l.textColor = .black
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        l.numberOfLines = 0
        return l
        }()
    private lazy var arrowImageView: UIImageView = { [unowned self] in
        let i = UIImageView(frame: CGRect(origin: CGPoint.zero,
                                          size: CGSize(width: margin * 2, height: margin * 2)))
        guard let image = UIImage(named: "arrowRight") else { return i }
        i.image = image
        i.contentMode = .center
        return i
        }()
    private lazy var descriptionLabel: UILabel = { [unowned self] in
        let l = UILabel()
        l.textColor = .black
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        l.numberOfLines = 0
        return l
        }()
    private lazy var feeLabel: UILabel = { [unowned self] in
        let l = UILabel()
        l.text = "Абонентская плата"
        l.textColor = .gray
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return l
        }()
    private lazy var priceLabel: UILabel = { [unowned self] in
        let l = UILabel()
        l.textColor = .black
        l.textAlignment = .left
        l.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return l
        }()
    private lazy var activeSwitch: UISwitch = { [unowned self] in
        let s = UISwitch()
        s.onTintColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        s.isOn = true
        return s
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        var nextTopAncor: NSLayoutAnchor = backView.topAnchor
        Helper.addConstrainted(backView, over: self)
        
        // create Name + Arrow
        arrowImageView.widthAnchor.constraint(equalToConstant: margin * 2).isActive = true
        let stack = UIStackView(arrangedSubviews: [serviceNameLabel,arrowImageView])
        stack.axis = .horizontal
        Helper.addConstrainted(serviceNameLabel, over: stack, top: 0, left: 0, right: margin * 2, bottom: 0)
        Helper.addOneFromListConstrainted(stack, over: backView, nextTopAncor: &nextTopAncor)
        
        // add Description
        Helper.addOneFromListConstrainted(descriptionLabel, over: backView, nextTopAncor: &nextTopAncor)
        
        // create Bottom subview
        feeLabel.heightAnchor.constraint(equalToConstant: margin * 2).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: margin * 2).isActive = true
        let vStack = UIStackView(arrangedSubviews: [feeLabel, priceLabel])
        vStack.axis = .vertical
        let hStack = UIStackView(arrangedSubviews: [vStack, activeSwitch])
        hStack.axis = .horizontal
        hStack.alignment = .center
        Helper.addOneFromListConstrainted(hStack, over: backView, nextTopAncor: &nextTopAncor)
        
        // set Bottom border
        backView.bottomAnchor.constraint(equalTo: nextTopAncor, constant: margin).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ subscription: ClientSubscription) {
        serviceNameLabel.text = subscription.serviceName
        descriptionLabel.text = subscription.description
        priceLabel.text = "\(subscription.price)₽ в сутки"
    }
}
