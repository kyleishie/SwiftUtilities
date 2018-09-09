//
//  ProcessInfo+Helpers.swift
//  KIDServer
//
//  Created by Kyle Ishie on 12/3/17.
//

import Foundation

extension ProcessInfo {
    
    public var debug: Bool {
        return ProcessInfo.processInfo.arguments.contains("--debug")
    }
    
    public var port: Int? {
        let args = ProcessInfo.processInfo.arguments
        
        var port: Int?
        
        for arg in args {
            var argParts: [String]?
            
            if arg.contains("--port") {
                argParts = arg.components(separatedBy: "=")
            } else if arg.contains("-p") {
                argParts = arg.components(separatedBy: " ")
            }
            
            guard let last = argParts?.last else {
                continue
            }
            
            port = Int(last)
        }
        
        return port
    }
    
    public var loggingEnabled: Bool {
        let args = ProcessInfo.processInfo.arguments
        
        var logging: Bool?
        
        for arg in args {
            logging = arg.contains("--verbose") || arg.contains("-v")
            
            if logging == true {
                break
            }
        }
        
        guard let loggingEnabled = logging else {
            return false
        }
        
        return loggingEnabled
    }
    
}
