//
//  OneButtonCell.swift
//  testClientSubscription
//
//  Created by Владимир Микищенко on 31/07/2019.
//  Copyright © 2019 Владимир Микищенко. All rights reserved.
//

import UIKit

class OneButtonCell: UITableViewCell {
    fileprivate let margin: CGFloat = 10
    fileprivate var action: (()->())?
    
    private lazy var button: UIButton = { [unowned self] in
        let b = UIButton()
        b.backgroundColor = .white
        b.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        b.titleLabel?.textAlignment = .center
        b.titleEdgeInsets = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        b.setTitleColor(.black, for: .normal)
        b.layer.cornerRadius = self.frame.height / 2
        b.clipsToBounds = true
        return b
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        Helper.addCentered(button, over: self, width: frame.width * 3/4)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(_ isShowAll: Bool, _ countItems: Int, action: @escaping ()->()) {
        // в результате поиска может оставаться одна услуга, не показываем кнопку
        guard countItems > 1 else { button.isHidden = true; return }
        button.isHidden = false
        self.action = action
        let hideText = NSMutableAttributedString(string: "Скрыть ")
        hideText.append(attachmentIcon("arrowUp"))
        let showText = NSMutableAttributedString(string: "Ещё \(String(describing: countItems)) услуг и подписки ")
        showText.append(attachmentIcon("arrowDown"))
        button.setAttributedTitle(isShowAll ? hideText : showText, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        guard let action = action else { return }
        action()
    }
    
    fileprivate func attachmentIcon(_ name: String) -> NSAttributedString {
        let icon = NSTextAttachment()
        icon.image = UIImage(named: name)?.withRenderingMode(.alwaysTemplate)
        let attribute = [NSAttributedString.Key.baselineOffset: -6]
        let attrStr = NSMutableAttributedString(attachment: icon)
        attrStr.addAttributes(attribute, range: NSRange(location: 0, length: 1))
        return attrStr
    }
}
