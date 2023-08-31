//
//  SHA256+Hash.swift
//  Look Around
//
//  Created by Zeref on 31/08/23.
//

import Foundation
import CryptoKit

extension SHA256 {
    static func hash(string: String) -> String {
        guard let data = string.data(using: .utf8) else {
            return ""
        }
        let digest = SHA256.hash(data: data)
        let hash = digest.compactMap { String(format: "%02x", $0) }.joined()
        return hash
    }
}
