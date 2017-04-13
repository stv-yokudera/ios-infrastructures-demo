//
//  DataAccessObject.swift
//  ios-infrastructures-demo
//
//  Created by OkuderaYuki on 2017/04/14.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

import Foundation
import FMDB

protocol BaseDao {
    var baseDao: DataAccessObject { get }
}

final class DataAccessObject: NSObject {
    static let dbPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!.appendingPathComponent("demo.db")
    
    var db: FMDatabase
    
    override init() {
        db = FMDatabase(path: DataAccessObject.dbPath)
    }
    
    func dbOpen() -> Bool {
        let isOpened = db.open()
        
        if !isOpened {
            fatalError("Failed to open database.")
        }
        return isOpened
    }
    
    func dbClose() -> Bool {
        let isClosed = db.close()
        
        if !isClosed {
            fatalError("Failed to close database.")
        }
        return isClosed
    }
}
