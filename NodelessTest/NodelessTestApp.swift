//
//  NodelessTestApp.swift
//  NodelessTest
//
//  Created by Ross Savage on 05/11/2024.
//

import SwiftUI
import BreezSDKLiquid
import OSLog

var BREEZ_API_KEY = ""
var MNEMONIC = ""

let logger = Logger()

@main
struct NodelessTestApp: App {
    var sdk: BindingLiquidSdk?
    
    init() {
        do {
            let applicationDirectory = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
            
            var config = try defaultConfig(network: LiquidNetwork.mainnet, breezApiKey: BREEZ_API_KEY)
            config.workingDir = applicationDirectory.path
            
            sdk = try connect(req: ConnectRequest(config: config, mnemonic: MNEMONIC))
            logger.log("Connected")
            let getInfo = try sdk!.getInfo()
            logger.log("Get Info: \(getInfo.pubkey)")
        } catch let err {
            logger.log("Error: \(err)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
