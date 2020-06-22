//
//  Success.swift
//  Restaurant
//
//  Created by Mac on 6/22/20.
//  Copyright © 2020 Amrit Duwal. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct Success: Codable {
    let statuscode: Int?
    let message, body: String
}
