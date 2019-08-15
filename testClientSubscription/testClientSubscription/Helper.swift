//
//  Helper.swift
//  testClientSubscription
//
//  Created by Владимир Микищенко on 08/08/2019.
//  Copyright © 2019 Владимир Микищенко. All rights reserved.
//

import UIKit

class Helper {
    
    static func addConstrainted(_ subview: UIView,
                                over superview: UIView,
                                top: CGFloat = 8,
                                left: CGFloat = 8,
                                right: CGFloat = 8,
                                bottom: CGFloat = 8) {
        superview.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: superview.topAnchor, constant: top).isActive = true
        subview.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: left).isActive = true
        subview.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -right).isActive = true
        subview.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -bottom).isActive = true
    }
    
    static func addCentered(_ subview: UIView,
                            over superView: UIView,
                            width: CGFloat,
                            height: CGFloat = 44) {
        superView.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        subview.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
        subview.widthAnchor.constraint(greaterThanOrEqualToConstant: width).isActive = true
        subview.heightAnchor.constraint(greaterThanOrEqualToConstant: height).isActive = true
    }
    
    static func add3SidesFenced(_ subview: UIView,
                                over superView: UIView,
                                top: CGFloat = 10,
                                left: CGFloat = 10,
                                right: CGFloat = 10,
                                height: CGFloat = 44) {
        superView.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: superView.topAnchor, constant: top).isActive = true
        subview.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: left).isActive = true
        subview.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -right).isActive = true
        subview.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    static func addOneFromListConstrainted(_ subview: UIView,
                                           over superView: UIView,
                                           top: CGFloat = 10,
                                           left: CGFloat = 20,
                                           right: CGFloat = 20,
                                           nextTopAncor: inout NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        superView.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.topAnchor.constraint(equalTo: nextTopAncor, constant: top).isActive = true
        subview.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: left).isActive = true
        subview.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -right).isActive = true
        nextTopAncor = subview.bottomAnchor
    }
}
