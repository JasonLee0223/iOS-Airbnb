//
//  Reusable.swift
//  Airbnb
//
//  Created by Jason on 10/23/23.
//

import Foundation

protocol Reusable {
    static var identifier: String { get }
}

extension Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}
