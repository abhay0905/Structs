//
//  Log.swift
//  Abhay Shankar
//
//  Created by Abhay Shankar on 22/08/18.
//  Copyright © 2018 Abhay Shankar. All rights reserved.
//

import Foundation

/// Logging responses in a text file.
/// - Important:
/// To be used in Development only

struct Log: TextOutputStream {
    
    func write(_ string: String) {
         #if DEBUG
        let fm = FileManager.default
        let log = fm.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("log.txt")
        if let handle = try? FileHandle(forWritingTo: log) {
            handle.seekToEndOfFile()
            handle.write(string.data(using: .utf8)!)
            handle.closeFile()
        } else {
            try? string.data(using: .utf8)?.write(to: log)
        }
         #endif
    }
}

var logger = Log()
