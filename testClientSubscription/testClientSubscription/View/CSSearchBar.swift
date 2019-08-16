//
//  CSSearchBar.swift
//  testClientSubscription
//
//  Created by Владимир Микищенко on 31/07/2019.
//  Copyright © 2019 Владимир Микищенко. All rights reserved.
//

import UIKit

class CSSearchBar: UIView {
    var items: [ClientSubscription] = []
    
    private lazy var searchField: UITextField = { [unowned self] in
        let field = UITextField()
        field.backgroundColor = .white
        field.placeholder = "Введите название услуги"
        field.borderStyle = .roundedRect
        field.tintColor = .gray
        field.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(named: "searchIcon")
        imageView.image = image
        imageView.contentMode = .right
        field.leftView = imageView
        field.leftViewMode = .unlessEditing
        field.clearButtonMode = .whileEditing
        field.addTarget(nil, action: #selector(CSController.searchTextDidChange(_:)), for: .editingChanged)
        field.delegate = self
        return field
        }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        Helper.addConstrainted(searchField, over: self)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITextFieldDelegate

extension CSSearchBar: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard var text = textField.text else { return true }
        text += string
        let filteredItems = items.filter {
            $0.serviceName.uppercased().contains(text.uppercased()) ||
                $0.description.uppercased().contains(text.uppercased())
        }
        // вариант noDataView я не предусмотрел. Просто не получится ввести несуществующий запрос
        return !filteredItems.isEmpty
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
