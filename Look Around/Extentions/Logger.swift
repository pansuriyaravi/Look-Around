//
//  Logger.swift
//  Look Around
//
//  Created by mac on 31/08/23.
//

import Foundation
import os.log

extension Logger {
    init(category: String) {
        guard let bundleIdentifier = Bundle.main.bundleIdentifier else {
            fatalError("Unable to retrieve bundle identifier.")
        }
        self.init(subsystem: bundleIdentifier, category: category)
    }
}
