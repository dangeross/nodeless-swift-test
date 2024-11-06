//
//  Logger.swift
//  NodelessTest
//
//  Created by Ross Savage on 06/11/2024.
//

import OSLog

extension Logger {
    private static let subsystem = Bundle.main.bundleIdentifier ?? "com.example.app"
    
    static func makeLogger(category: String) -> Logger {
        return Logger(subsystem: subsystem, category: category)
    }
    
    static let sdk = makeLogger(category: "sdk")
    static let ui = makeLogger(category: "ui")
}
