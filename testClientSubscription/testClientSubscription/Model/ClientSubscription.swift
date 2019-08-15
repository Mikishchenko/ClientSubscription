//
//  ClientSubscription.swift
//  testClientSubscription
//
//  Created by Владимир Микищенко on 30/07/2019.
//  Copyright © 2019 Владимир Микищенко. All rights reserved.
//

import Foundation

protocol CSProtocol {
    var serviceName: String { get }
    var description: String { get }
    var price: Int { get }
}

struct ClientSubscription: CSProtocol, Decodable {
    let serviceName: String
    let description: String
    let price: Int
}
