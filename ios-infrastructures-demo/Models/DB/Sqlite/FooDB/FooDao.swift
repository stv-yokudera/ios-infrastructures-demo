//
//  FooDao.swift
//  ios-infrastructures-demo
//
//  Created by OkuderaYuki on 2017/04/14.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

import Foundation


/// DBError種別
///
/// - error1: db open失敗
/// - error2: db execute失敗
/// - error3: db execute失敗
enum dbError: Error {
    case error1
    case error2
    case error3
}

/// DB処理結果
///
/// - success: 成功
/// - failure: 失敗
enum dbResult<VALUE> {
    case success(VALUE)
    case failure(dbError)
}

final class FooDao: NSObject {
    let baseDao = DataAccessObject()
    
    // MARK:- SELECT
    
    /// Fooテーブルのレコードを全件取得する
    func selectAll() -> dbResult<[FooDto]?> {
        let sql = "SELECT * FROM Foo"
        
        var resultArray: [FooDto] = []
        
        if !baseDao.dbOpen() {
            // db open失敗
            return .failure(dbError.error1)
        }
        
        guard let result = baseDao.db.executeQuery(sql, withArgumentsIn: nil) else {
            // db execute失敗
            return .failure(dbError.error2)
        }
        
        while result.next() {
            
            let fooDto = FooDto()
            fooDto.id = Int(result.int(forColumn: "id"))
            fooDto.name = result.string(forColumn: "name")
            fooDto.updateDate = result.date(forColumn: "updateDate")
            resultArray.append(fooDto)
        }
        
        // SELECT成功 : db execute失敗
        return baseDao.dbClose() ? .success(resultArray) : .failure(dbError.error3)
    }
}

// MARK: - BaseDao
extension FooDao: BaseDao {}
