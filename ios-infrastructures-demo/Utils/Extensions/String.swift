//
//  String.swift
//  ios-infrastructures-demo
//
//  Created by OkuderaYuki on 2017/04/14.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

import Foundation

extension String {
    
    private var ns: NSString {
        return (self as NSString)
    }
    
    func appendingPathComponent(_ str: String) -> String {
        return ns.appendingPathComponent(str)
    }
}
